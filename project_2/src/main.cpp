#include <mysql.h>
#include <iostream>
#include <iomanip>
#include <string>
#include <limits>

const char* server   = "localhost";
const char* user     = "root";
const char* password = "1234";
const char* database = "convenience";

MYSQL* conn = nullptr;

/* ------------------------------------------------------------------ */
/*  Utility Functions                                                 */
/* ------------------------------------------------------------------ */
void exitWithError(const char* message) {
    std::cerr << "Error: " << message << std::endl;
    if (conn) {
        std::cerr << "MySQL Error: " << mysql_error(conn) << std::endl;
        mysql_close(conn);
    }
    exit(EXIT_FAILURE);
}

void printQueryResults(MYSQL_RES* result) {
    if (!result) return;
    
    unsigned int numFields = mysql_num_fields(result);
    MYSQL_FIELD* fields = mysql_fetch_fields(result);
    
    for (unsigned int i = 0; i < numFields; i++) {
        std::cout << std::left << std::setw(21) << fields[i].name;
    }
    std::cout << std::endl;
    std::cout << std::string(numFields * 21, '-') << std::endl;
    
    MYSQL_ROW row;
    while ((row = mysql_fetch_row(result))) {
        for (unsigned int i = 0; i < numFields; i++) {
            std::cout << std::left << std::setw(21) << (row[i] ? row[i] : "NULL");
        }
        std::cout << std::endl;
    }
    std::cout << std::endl;
}

int getUserChoice() {
    int choice;
    std::cout << "Select: ";
    std::cin >> choice;
    std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n');
    return choice;
}

std::string getUserInput(const std::string& prompt) {
    std::string input;
    std::cout << prompt;
    std::getline(std::cin, input);
    return input;
}

/* ------------------------------------------------------------------ */
/*  Query Functions                                                   */
/* ------------------------------------------------------------------ */

// Query 1: Product Availability - Using INVENTORY + PRODUCT entities
void executeProductAvailabilityQuery() {
    std::cout << "------- TYPE 1 -------" << std::endl;
    std::cout << "** Which stores currently carry a certain product (by UPC, name, or brand), and how much inventory do they have? **" << std::endl;
    
    std::string productIdentifier = getUserInput("Enter product identifier (UPC, name, or brand): ");
    
    std::string query = 
        "SELECT s.StoreID, s.Name AS StoreName, p.Name AS ProductName, i.CurrentStock "
        "FROM INVENTORY i "
        "JOIN STORE s ON i.StoreID = s.StoreID "
        "JOIN PRODUCT p ON i.UPC = p.UPC "
        "WHERE p.UPC LIKE '%" + productIdentifier + "%' "
        "   OR p.Name LIKE '%" + productIdentifier + "%' "
        "   OR p.Brand LIKE '%" + productIdentifier + "%' "
        "ORDER BY s.StoreID";
    
    if (mysql_query(conn, query.c_str())) {
        exitWithError("Query execution failed");
    }
    
    MYSQL_RES* result = mysql_store_result(conn);
    if (result) {
        printQueryResults(result);
        mysql_free_result(result);
    }
}

// Query 2: Top Selling Items - Using TRANSACTION + TRANSACTIONITEM + PRODUCT + STORE entities
void executeTopSellingItemsQuery() {
    std::cout << "-------- TYPE 2 --------" << std::endl;
    std::cout << "** Which products have the highest sales volume in each store over the past month? **" << std::endl;
    
    const char* query = 
        "SELECT StoreID, StoreName, ProductName, TotalUnits "
        "FROM ( "
        "    SELECT s.StoreID, s.Name AS StoreName, p.Name AS ProductName, "
        "           SUM(ti.Quantity) AS TotalUnits, "
        "           ROW_NUMBER() OVER (PARTITION BY s.StoreID ORDER BY SUM(ti.Quantity) DESC) as rn "
        "    FROM `TRANSACTION` t "
        "    JOIN TRANSACTIONITEM ti ON t.TransactionID = ti.TransactionID "
        "    JOIN STORE s ON t.StoreID = s.StoreID "
        "    JOIN PRODUCT p ON ti.UPC = p.UPC "
        "    WHERE t.DateTime >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH) "
        "    GROUP BY s.StoreID, ti.UPC "
        ") ranked "
        "WHERE rn = 1 "
        "ORDER BY StoreID";
    
    if (mysql_query(conn, query)) {
        exitWithError("Query execution failed");
    }
    
    MYSQL_RES* result = mysql_store_result(conn);
    if (result) {
        printQueryResults(result);
        mysql_free_result(result);
    }
}

// Query 3: Store Revenue - Using TRANSACTION entity with quarter filtering
void executeStorePerformanceQuery() {
    std::cout << "-------- TYPE 3 --------" << std::endl;
    std::cout << "** Which store has generated the highest overall revenue this quarter? **" << std::endl;
    
    const char* query = 
        "SELECT s.StoreID, s.Name AS StoreName, SUM(t.TotalAmount) AS QuarterlyRevenue "
        "FROM `TRANSACTION` t "
        "JOIN STORE s ON t.StoreID = s.StoreID "
        "WHERE QUARTER(t.DateTime) = QUARTER(CURDATE()) "
        "  AND YEAR(t.DateTime) = YEAR(CURDATE()) "
        "GROUP BY s.StoreID "
        "ORDER BY QuarterlyRevenue DESC "
        "LIMIT 1";
    
    if (mysql_query(conn, query)) {
        exitWithError("Query execution failed");
    }
    
    MYSQL_RES* result = mysql_store_result(conn);
    if (result) {
        printQueryResults(result);
        mysql_free_result(result);
    }
}

// Query 4: Vendor Stats - Using VENDOR + PRODUCT + TRANSACTIONITEM entities
void executeVendorStatsQuery() {
    std::cout << "-------- TYPE 4 --------" << std::endl;
    std::cout << "** Which vendor supplies the most products across the chain, and how many total units have been sold? **" << std::endl;
    
    const char* query = 
        "SELECT v.VendorID, v.Name AS VendorName, "
        "       COUNT(DISTINCT p.UPC) AS ProductCount, "
        "       COALESCE(SUM(ti.Quantity), 0) AS TotalUnitsSold "
        "FROM VENDOR v "
        "JOIN PRODUCT p ON v.VendorID = p.VendorID "
        "LEFT JOIN TRANSACTIONITEM ti ON p.UPC = ti.UPC "
        "GROUP BY v.VendorID "
        "ORDER BY ProductCount DESC, TotalUnitsSold DESC "
        "LIMIT 1";
    
    if (mysql_query(conn, query)) {
        exitWithError("Query execution failed");
    }
    
    MYSQL_RES* result = mysql_store_result(conn);
    if (result) {
        printQueryResults(result);
        mysql_free_result(result);
    }
}

// Query 5: Reorder Alerts - Using INVENTORY entity with threshold comparison
void executeReorderAlertQuery() {
    std::cout << "-------- TYPE 5 --------" << std::endl;
    std::cout << "** Which products in each store are below the reorder threshold and need restocking? **" << std::endl;
    
    const char* query = 
        "SELECT s.StoreID, s.Name AS StoreName, p.Name AS ProductName, "
        "       i.CurrentStock, i.ReorderThreshold "
        "FROM INVENTORY i "
        "JOIN STORE s ON i.StoreID = s.StoreID "
        "JOIN PRODUCT p ON i.UPC = p.UPC "
        "WHERE i.CurrentStock < i.ReorderThreshold "
        "ORDER BY s.StoreID, p.Name";
    
    if (mysql_query(conn, query)) {
        exitWithError("Query execution failed");
    }
    
    MYSQL_RES* result = mysql_store_result(conn);
    if (result) {
        printQueryResults(result);
        mysql_free_result(result);
    }
}

// Query 6: Coffee Bundling - Using CUSTOMER + TRANSACTION + TRANSACTIONITEM + PRODUCT entities
void executeCoffeeBundlingQuery() {
    std::cout << "-------- TYPE 6 --------" << std::endl;
    std::cout << "** List the top 3 items that loyalty program customers typically purchase with coffee. **" << std::endl;
    
    std::string coffeeProduct = getUserInput("Enter a product name: ");
    
    std::string query = 
        "SELECT p2.Name AS ProductName, SUM(ti2.Quantity) AS TotalQuantity "
        "FROM `TRANSACTION` t "
        "JOIN TRANSACTIONITEM ti1 ON t.TransactionID = ti1.TransactionID "
        "JOIN PRODUCT p1 ON ti1.UPC = p1.UPC "
        "JOIN TRANSACTIONITEM ti2 ON t.TransactionID = ti2.TransactionID "
        "JOIN PRODUCT p2 ON ti2.UPC = p2.UPC "
        "WHERE t.CustomerID IS NOT NULL "
        "  AND p1.Name LIKE '%" + coffeeProduct + "%' "
        "  AND ti2.UPC != ti1.UPC "
        "GROUP BY p2.UPC "
        "ORDER BY TotalQuantity DESC "
        "LIMIT 3";
    
    if (mysql_query(conn, query.c_str())) {
        exitWithError("Query execution failed");
    }
    
    MYSQL_RES* result = mysql_store_result(conn);
    if (result) {
        printQueryResults(result);
        mysql_free_result(result);
    }
}

// Query 7: Franchise vs Corporate - Using STORE + INVENTORY entities
void executeFranchiseVsCorporateQuery() {
    std::cout << "-------- TYPE 7 --------" << std::endl;
    std::cout << "** Among franchise-owned stores, which one offers the widest variety of products, and how does that compare to corporate-owned stores? **" << std::endl;
    
    const char* query = 
        "SELECT OwnershipType, StoreID, StoreName, ProductVariety "
        "FROM ( "
        "    SELECT s.StoreID, s.Name AS StoreName, s.OwnershipType, "
        "           COUNT(DISTINCT i.UPC) AS ProductVariety, "
        "           ROW_NUMBER() OVER (PARTITION BY s.OwnershipType ORDER BY COUNT(DISTINCT i.UPC) DESC) as rn "
        "    FROM STORE s "
        "    JOIN INVENTORY i ON s.StoreID = i.StoreID "
        "    GROUP BY s.StoreID "
        ") ranked "
        "WHERE rn = 1 "
        "ORDER BY OwnershipType";
    
    if (mysql_query(conn, query)) {
        exitWithError("Query execution failed");
    }
    
    MYSQL_RES* result = mysql_store_result(conn);
    if (result) {
        printQueryResults(result);
        mysql_free_result(result);
    }
}

/* ------------------------------------------------------------------ */
/*  Menu and Main Program                                             */
/* ------------------------------------------------------------------ */
void displayMenu() {
    std::cout << "\n------------ SELECT QUERY TYPES ------------" << std::endl;
    std::cout << "1. TYPE 1" << std::endl;
    std::cout << "2. TYPE 2" << std::endl;
    std::cout << "3. TYPE 3" << std::endl;
    std::cout << "4. TYPE 4" << std::endl;
    std::cout << "5. TYPE 5" << std::endl;
    std::cout << "6. TYPE 6" << std::endl;
    std::cout << "7. TYPE 7" << std::endl;
    std::cout << "0. QUIT" << std::endl;
}

void exitProgram() {
    std::cout << "Goodbye!" << std::endl;
    if (conn) {
        mysql_close(conn);
    }
    exit(0);
}

void initializeDatabase() {
    conn = mysql_init(nullptr);
    if (!conn) {
        exitWithError("Failed to initialize MySQL connection");
    }
    
    if (!mysql_real_connect(conn, server, user, password, database, 0, nullptr, 0)) {
        exitWithError("Failed to connect to database");
    }
    
    std::cout << "Connected to convenience store database successfully!" << std::endl;
}

int main() {
    initializeDatabase();
    
    while (true) {
        displayMenu();
        int choice = getUserChoice();
        
        switch (choice) {
            case 1:
                executeProductAvailabilityQuery();
                break;
            case 2:
                executeTopSellingItemsQuery();
                break;
            case 3:
                executeStorePerformanceQuery();
                break;
            case 4:
                executeVendorStatsQuery();
                break;
            case 5:
                executeReorderAlertQuery();
                break;
            case 6:
                executeCoffeeBundlingQuery();
                break;
            case 7:
                executeFranchiseVsCorporateQuery();
                break;
            case 0:
                exitProgram();
                break;
            default:
                std::cout << "Invalid option. Please try again." << std::endl;
        }
    }
    
    return 0;
}

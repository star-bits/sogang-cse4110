DROP DATABASE IF EXISTS convenience;
CREATE DATABASE convenience CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE convenience;

CREATE TABLE STORE (
    StoreID        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Name           VARCHAR(100) NOT NULL,
    Address        VARCHAR(255) NOT NULL,
    OpeningHours   VARCHAR(100) NOT NULL,
    OwnershipType  ENUM('Company-owned','Franchise') NOT NULL
);

CREATE TABLE CUSTOMER (
    CustomerID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Name       VARCHAR(100) NOT NULL,
    Phone      VARCHAR(20)  NOT NULL,
    Email      VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE VENDOR (
    VendorID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Name     VARCHAR(100) NOT NULL,
    Contact  VARCHAR(255) NOT NULL
);

CREATE TABLE PRODUCT (
    UPC         CHAR(12) PRIMARY KEY,
    Name        VARCHAR(100) NOT NULL,
    Brand       VARCHAR(50)  NOT NULL,
    PackageType VARCHAR(50)  NOT NULL,
    Size        VARCHAR(50)  NOT NULL,
    Price       DECIMAL(10) NOT NULL CHECK (Price >= 0),
    VendorID    INT UNSIGNED NOT NULL,
    CONSTRAINT foreign_key_product_vendor -- Links each product to its vendor
        FOREIGN KEY (VendorID) REFERENCES VENDOR(VendorID)
        ON UPDATE CASCADE  -- If vendor ID changes, update all products automatically
        ON DELETE RESTRICT -- Prevent deleting vendors who supply products
);

CREATE TABLE `TRANSACTION` (
    TransactionID BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    StoreID       INT UNSIGNED NOT NULL,
    TotalAmount   DECIMAL(10) NOT NULL CHECK (TotalAmount >= 0),
    DateTime      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CustomerID    INT UNSIGNED NULL,
    PaymentMethod ENUM('Cash','Card','Other') NOT NULL,
    CONSTRAINT foreign_key_transaction_store -- Links each transaction to the store where it occurred
        FOREIGN KEY (StoreID) REFERENCES STORE(StoreID)
        ON UPDATE CASCADE  -- If store ID changes, update all transactions automatically
        ON DELETE RESTRICT, -- Prevent deleting stores with transaction history
    CONSTRAINT foreign_key_transaction_customer -- Links transactions to customers
        FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
        ON UPDATE CASCADE  -- If customer ID changes, update all transactions automatically
        ON DELETE RESTRICT -- Prevent deleting customers with purchase history
);

CREATE TABLE TRANSACTIONITEM (
    TransactionID BIGINT UNSIGNED NOT NULL,
    UPC           CHAR(12) NOT NULL,
    Quantity      INT UNSIGNED NOT NULL CHECK (Quantity > 0),
    Subtotal      DECIMAL(10) NOT NULL CHECK (Subtotal >= 0),
    PRIMARY KEY (TransactionID, UPC),
    CONSTRAINT foreign_key_transactionitem_transaction -- Links each item to its parent transaction
        FOREIGN KEY (TransactionID) REFERENCES `TRANSACTION`(TransactionID)
        ON UPDATE CASCADE -- If transaction ID changes, update all items automatically
        ON DELETE CASCADE, -- If transaction is deleted, remove all its items 
    CONSTRAINT foreign_key_transactionitem_product -- Links each transaction item to the actual product sold
        FOREIGN KEY (UPC) REFERENCES PRODUCT(UPC)
        ON UPDATE CASCADE -- If product UPC changes, update all transaction records automatically
        ON DELETE RESTRICT -- Prevent deleting products that appear in sales history
);

CREATE TABLE INVENTORY (
    StoreID          INT UNSIGNED NOT NULL,
    UPC              CHAR(12)     NOT NULL,
    CurrentStock     INT UNSIGNED NOT NULL CHECK (CurrentStock >= 0),
    ReorderThreshold INT UNSIGNED NOT NULL CHECK (ReorderThreshold >= 0),
    ReorderQuantity  INT UNSIGNED NOT NULL CHECK (ReorderQuantity  > 0),
    LastRestockDate  DATE         NOT NULL,
    PRIMARY KEY (StoreID, UPC),
    CONSTRAINT foreign_key_inventory_store -- Links inventory records to specific stores
        FOREIGN KEY (StoreID) REFERENCES STORE(StoreID)
        ON UPDATE CASCADE  -- If store ID changes, update all inventory records automatically
        ON DELETE RESTRICT, -- Prevent deleting stores that have inventory records
    CONSTRAINT foreign_key_inventory_product -- Links inventory records to specific products
        FOREIGN KEY (UPC) REFERENCES PRODUCT(UPC)
        ON UPDATE CASCADE -- If product UPC changes, update all inventory records automatically
        ON DELETE RESTRICT -- Prevent deleting products that are currently stocked
);

USE convenience;

INSERT INTO STORE (Name, Address, OpeningHours, OwnershipType) VALUES
('Gangnam Mart', '123 Gangnam-daero', '08:00–22:00', 'Company-owned'),
('Hongdae Shop', '456 Hongik-ro', '07:00–23:00', 'Franchise'),
('Myeongdong Market', '789 Myeongdong-gil', '09:00–21:00', 'Company-owned'),
('Sinchon Corner', '321 Yonsei-ro', '06:00–24:00', 'Franchise'),
('Seoul Station Store', '654 Station Plaza', '05:30–23:30', 'Company-owned'),
('Hangang Express', '987 Hangang-ro', '07:30–22:30', 'Franchise'),
('Itaewon Quick Stop', '147 Itaewon-ro', '08:00–21:00', 'Company-owned'),
('Incheon Rest Stop', '258 Highway 1', '24/7', 'Franchise'),
('Jongno Business Shop', '369 Jongno-gu', '07:00–20:00', 'Company-owned'),
('Busan Beach Market', '741 Haeundae Beach', '08:30–22:00', 'Franchise'),
('Namsan View Store', '852 Namsan-ro', '09:00–20:00', 'Company-owned'),
('Lotte Mall Express', '963 Lotte World', '10:00–22:00', 'Franchise'),
('Gimpo Airport Shop', '159 Airport Terminal', '24/7', 'Company-owned'),
('Dongdaemun Market', '753 Dongdaemun-gu', '08:00–21:30', 'Franchise'),
('Jung-gu Convenience', '486 Jung-gu Plaza', '07:00–23:00', 'Company-owned');

INSERT INTO CUSTOMER (Name, Phone, Email) VALUES
('Kim Min-jun', '010-1234-5678', 'minjun.kim@naver.com'),
('Park So-young', '010-2345-6789', 'soyoung.park@gmail.com'),
('Lee Dong-hyun', '010-3456-7890', 'donghyun.lee@daum.net'),
('Choi Ji-hye', '010-4567-8901', 'jihye.choi@naver.com'),
('Jung Woo-jin', '010-5678-9012', 'woojin.jung@hanmail.net'),
('Song Ha-eun', '010-6789-0123', 'haeun.song@gmail.com'),
('Yoon Seung-ho', '010-7890-1234', 'seungho.yoon@naver.com'),
('Han Yu-ri', '010-8901-2345', 'yuri.han@daum.net'),
('Lim Jae-min', '010-9012-3456', 'jaemin.lim@gmail.com'),
('Kang Su-bin', '010-0123-4567', 'subin.kang@naver.com'),
('Oh Min-seo', '010-1357-2468', 'minseo.oh@hanmail.net'),
('Bae Hyun-woo', '010-2468-1357', 'hyunwoo.bae@gmail.com'),
('Shin Ye-jin', '010-3579-0246', 'yejin.shin@daum.net'),
('Moon Tae-young', '010-4680-1357', 'taeyoung.moon@naver.com'),
('Kwon Soo-ah', '010-5791-2468', 'sooah.kwon@gmail.com'),
('Jang Ki-tae', '010-6802-3579', 'kitae.jang@hanmail.net'),
('Seo Ye-eun', '010-7913-4680', 'yeeun.seo@naver.com'),
('Go Min-ki', '010-8024-5791', 'minki.go@daum.net'),
('Nam Hyo-jin', '010-9135-6802', 'hyojin.nam@gmail.com'),
('Ryu Sang-hoon', '010-0246-7913', 'sanghoon.ryu@naver.com');

INSERT INTO VENDOR (Name, Contact) VALUES
('Maxim Coffee Korea', 'sales@maximkorea.co.kr'),
('Seoul Dairy Co', 'info@seouldairy.co.kr'),
('Orion Snacks', 'hello@orionsnacks.co.kr'),
('Lotte Beverages', 'orders@lottebev.co.kr'),
('CJ HealthyLife', 'sales@cjhealthy.co.kr'),
('Crown Confectionery', 'contact@crown.co.kr'),
('Pulmuone Foods', 'frozen@pulmuone.co.kr'),
('Paris Baguette', 'orders@parisbaguette.co.kr'),
('Kwangdong Pharmaceutical', 'sales@kwangdong.co.kr'),
('Jeju Spring Water', 'info@jejuspring.co.kr'),
('Haitai Confectionery', 'wholesale@haitai.co.kr'),
('Ottogi Foods', 'orders@ottogi.co.kr'),
('Hansalim Organic', 'sales@hansalim.co.kr'),
('Red Bull Korea', 'contact@redbull.co.kr'),
('Nongshim Foods', 'sales@nongshim.co.kr');

INSERT INTO PRODUCT (UPC, Name, Brand, PackageType, Size, Price, VendorID) VALUES
('000000000111','Premium Coffee Beans', 'Maxim','Bag', '500g', 12000, 1),
('000000000112','Original Coffee Mix', 'Maxim','Bag', '1kg', 18000, 1),
('000000000113','Dark Roast Americano', 'Maxim','Bag', '250g', 9500, 1),
('000000000114','Instant Coffee Stick', 'Maxim','Box', '200g', 7500, 1),

('000000000201','Fresh Whole Milk', 'Seoul Dairy','Carton','1L', 2800, 2),
('000000000202','Greek Style Yogurt', 'Seoul Dairy','Cup', '200g', 1900, 2),
('000000000203','Cheddar Cheese', 'Seoul Dairy','Package','200g', 4500, 2),
('000000000204','Unsalted Butter', 'Seoul Dairy','Block','250g', 3800, 2),

('000000000301','Honey Butter Chips', 'Orion','Bag', '150g', 3200, 3),
('000000000302','Choco Pie', 'Orion','Box', '250g', 4300, 3),
('000000000303','Sweet Potato Snack', 'Orion','Bag', '200g', 2800, 3),

('000000000401','Milkis Soda', 'Lotte','Bottle','500ml', 2500, 4),
('000000000402','Orange Juice', 'Lotte','Carton','1L', 5200, 4),
('000000000403','Hot6 Energy Drink', 'Red Bull Korea','Can','250ml', 3500, 14),

('000000000501','Nature Valley Bar', 'CJ HealthyLife','Bar','50g', 2100, 5),
('000000000502','Mixed Nuts', 'CJ HealthyLife','Bag','100g', 4200, 5),
('000000000503','Protein Energy Bar', 'Kwangdong','Bar','60g', 4800, 9),

('000000000601','Ghana Chocolate', 'Crown','Bar','100g', 3100, 6),
('000000000602','Haribo Gummy', 'Haitai','Bag','200g', 2600, 11),
('000000000603','Tic Tac Mint', 'Crown','Pack','50g', 1800, 6),

('000000000701','Melona Ice Bar', 'Pulmuone','Pack','6 count', 6800, 7),
('000000000702','Bulgogi Pizza', 'Ottogi','Box','300g', 8200, 12),

('000000000801','Butter Croissant', 'Paris Baguette','Piece','80g', 2800, 8),
('000000000802','Blueberry Muffin', 'Paris Baguette','Piece','120g', 3400, 8),

('000000000901','Jeju Spring Water', 'Jeju Spring','Bottle','500ml', 1200, 10),
('000000000902','Pocari Sweat', 'Jeju Spring','Bottle','750ml', 3200, 10),

('000000001001','Shin Ramyun Cup', 'Nongshim','Cup','75g', 1800, 15),
('000000001002','Rice Crackers', 'Nongshim','Box','200g', 2900, 15),

('000000001101','Organic Korean Pear', 'Hansalim','Piece','200g', 2100, 13),
('000000001102','Organic Banana', 'Hansalim','Bunch','500g', 4200, 13);

INSERT INTO INVENTORY VALUES
-- Store 1: Gangnam Mart (Company-owned) - wide variety
(1,'000000000111', 40, 10, 30, '2025-05-01'),
(1,'000000000112', 25, 10, 20, '2025-04-28'),
(1,'000000000201', 8, 15, 40, '2025-05-03'),   -- below threshold
(1,'000000000301', 45, 20, 50, '2025-05-01'),
(1,'000000000401', 60, 25, 75, '2025-05-02'),
(1,'000000000501', 30, 15, 40, '2025-05-01'),
(1,'000000000601', 5, 10, 30, '2025-05-03'),   -- below threshold
(1,'000000000701', 12, 8, 20, '2025-04-30'),
(1,'000000000801', 20, 12, 25, '2025-05-04'),
(1,'000000000901', 100, 30, 80, '2025-05-02'),
-- Store 2: Hongdae Shop (Franchise) - smaller variety
(2,'000000000111', 8, 10, 30, '2025-05-02'),   -- below threshold
(2,'000000000301', 90, 20, 50, '2025-05-01'),
(2,'000000000302', 60, 15, 40, '2025-05-01'),
(2,'000000000401', 35, 20, 60, '2025-05-03'),
(2,'000000000501', 25, 15, 40, '2025-05-02'),
(2,'000000000901', 80, 25, 70, '2025-05-01'),
-- Store 3: Myeongdong Market (Company-owned) - medium variety
(3,'000000000112', 18, 10, 20, '2025-05-03'),
(3,'000000000202', 5, 10, 40, '2025-05-02'),   -- below threshold
(3,'000000000301', 70, 20, 50, '2025-05-02'),
(3,'000000000401', 45, 25, 75, '2025-05-01'),
(3,'000000000502', 15, 8, 25, '2025-05-03'),
(3,'000000000601', 40, 15, 45, '2025-05-02'),
(3,'000000000701', 6, 8, 20, '2025-05-01'),    -- below threshold
-- Store 4: Sinchon Corner (Franchise) - student-focused
(4,'000000000113', 50, 15, 40, '2025-05-01'),
(4,'000000000403', 80, 30, 60, '2025-05-02'),
(4,'000000000501', 60, 20, 50, '2025-05-01'),
(4,'000000000503', 45, 15, 40, '2025-05-03'),
(4,'000000000901', 120, 40, 100, '2025-05-02'),
(4,'000000001001', 3, 10, 30, '2025-05-01'),   -- below threshold
-- Store 5: Seoul Station Store (Company-owned) - high volume
(5,'000000000111', 35, 15, 50, '2025-05-02'),
(5,'000000000112', 28, 12, 30, '2025-05-01'),
(5,'000000000201', 40, 20, 60, '2025-05-03'),
(5,'000000000301', 85, 25, 75, '2025-05-02'),
(5,'000000000401', 90, 35, 100, '2025-05-01'),
(5,'000000000801', 25, 15, 35, '2025-05-04'),
(5,'000000000802', 30, 18, 40, '2025-05-04'),
(5,'000000000901', 150, 50, 120, '2025-05-02'),
-- Additional stores with selective inventory
(6,'000000000111', 20, 12, 35, '2025-05-02'),
(6,'000000000301', 55, 18, 45, '2025-05-01'),
(6,'000000000401', 40, 20, 60, '2025-05-03'),
(7,'000000000112', 15, 10, 25, '2025-05-03'),
(7,'000000000202', 22, 15, 35, '2025-05-02'),
(7,'000000000501', 35, 15, 40, '2025-05-01'),
(8,'000000000403', 65, 25, 50, '2025-05-02'),
(8,'000000000901', 95, 30, 80, '2025-05-01'),
(8,'000000001001', 45, 20, 50, '2025-05-03'),
-- More stores with varied inventory
(9,'000000000111', 30, 12, 35, '2025-05-01'),
(9,'000000000301', 60, 20, 55, '2025-05-02'),
(10,'000000000112', 22, 10, 25, '2025-05-03'),
(10,'000000000401', 50, 25, 70, '2025-05-01'),
(11,'000000000202', 18, 12, 30, '2025-05-02'),
(11,'000000000501', 28, 15, 40, '2025-05-01'),
(12,'000000000301', 75, 25, 60, '2025-05-02'),
(12,'000000000601', 35, 15, 45, '2025-05-01'),
(13,'000000000403', 40, 20, 50, '2025-05-03'),
(13,'000000000901', 80, 30, 75, '2025-05-02'),
(14,'000000000111', 25, 10, 30, '2025-05-01'),
(14,'000000000501', 20, 12, 35, '2025-05-03'),
(15,'000000000112', 35, 15, 40, '2025-05-02'),
(15,'000000000301', 65, 22, 55, '2025-05-01');

SET @today = CURDATE();

INSERT INTO `TRANSACTION` (StoreID, TotalAmount, DateTime, CustomerID, PaymentMethod) VALUES
-- High-performing store transactions 
(1, 32500, DATE_SUB(@today, INTERVAL 2 DAY), NULL, 'Card'),
(1, 21800, DATE_SUB(@today, INTERVAL 3 DAY), 1, 'Card'),
(1, 45200, DATE_SUB(@today, INTERVAL 5 DAY), 3, 'Card'),
(1, 26900, DATE_SUB(@today, INTERVAL 8 DAY), NULL, 'Cash'),
(1, 58700, DATE_SUB(@today, INTERVAL 12 DAY), 5, 'Card'),
(1, 31400, DATE_SUB(@today, INTERVAL 15 DAY), 2, 'Card'),
(1, 49800, DATE_SUB(@today, INTERVAL 18 DAY), NULL, 'Other'),
(1, 38600, DATE_SUB(@today, INTERVAL 22 DAY), 7, 'Card'),
(1, 54300, DATE_SUB(@today, INTERVAL 25 DAY), 4, 'Card'),
(1, 27500, DATE_SUB(@today, INTERVAL 28 DAY), NULL, 'Cash'),

-- Campus store (high energy drink sales)
(4, 23400, DATE_SUB(@today, INTERVAL 1 DAY), 8, 'Card'),
(4, 28600, DATE_SUB(@today, INTERVAL 4 DAY), NULL, 'Card'),
(4, 41800, DATE_SUB(@today, INTERVAL 6 DAY), 9, 'Card'),
(4, 52300, DATE_SUB(@today, INTERVAL 10 DAY), 10, 'Card'),
(4, 35400, DATE_SUB(@today, INTERVAL 13 DAY), NULL, 'Cash'),

-- Metro station (high volume, coffee focus)
(5, 58200, DATE_SUB(@today, INTERVAL 2 DAY), 11, 'Card'),
(5, 42600, DATE_SUB(@today, INTERVAL 4 DAY), NULL, 'Card'),
(5, 67800, DATE_SUB(@today, INTERVAL 7 DAY), 12, 'Card'),
(5, 49500, DATE_SUB(@today, INTERVAL 11 DAY), 13, 'Card'),
(5, 53700, DATE_SUB(@today, INTERVAL 16 DAY), NULL, 'Cash'),

-- Other stores for comparison
(2, 21800, DATE_SUB(@today, INTERVAL 3 DAY), 14, 'Card'),
(2, 29700, DATE_SUB(@today, INTERVAL 9 DAY), NULL, 'Cash'),
(3, 39400, DATE_SUB(@today, INTERVAL 5 DAY), 15, 'Card'),
(3, 34200, DATE_SUB(@today, INTERVAL 14 DAY), NULL, 'Card'),
(6, 24600, DATE_SUB(@today, INTERVAL 7 DAY), 16, 'Card'),
(7, 31200, DATE_SUB(@today, INTERVAL 12 DAY), NULL, 'Cash'),
(8, 48900, DATE_SUB(@today, INTERVAL 6 DAY), 17, 'Card'),
(9, 28300, DATE_SUB(@today, INTERVAL 10 DAY), 18, 'Card'),
(10, 23400, DATE_SUB(@today, INTERVAL 8 DAY), NULL, 'Cash'),

-- Quarter data (older transactions for quarterly analysis)
(1, 71500, DATE_SUB(@today, INTERVAL 45 DAY), 1, 'Card'),
(1, 62400, DATE_SUB(@today, INTERVAL 52 DAY), 3, 'Card'),
(1, 79800, DATE_SUB(@today, INTERVAL 67 DAY), NULL, 'Cash'),
(4, 48900, DATE_SUB(@today, INTERVAL 55 DAY), 8, 'Card'),
(5, 91200, DATE_SUB(@today, INTERVAL 48 DAY), 11, 'Card'),
(5, 76800, DATE_SUB(@today, INTERVAL 63 DAY), NULL, 'Card'),
(2, 44700, DATE_SUB(@today, INTERVAL 58 DAY), 14, 'Card'),
(3, 53200, DATE_SUB(@today, INTERVAL 61 DAY), 15, 'Card');

INSERT INTO TRANSACTIONITEM VALUES
-- High-performing Gangnam Mart transactions (focus on coffee + bakery combos)
(1,'000000000111',2,24000), (1,'000000000801',3,8400), (1,'000000000901',1,1200),
(2,'000000000112',1,18000), (2,'000000000202',2,3800),
(3,'000000000111',1,12000), (3,'000000000301',3,9600), (3,'000000000401',4,10000), (3,'000000000501',5,10500),
(4,'000000000113',2,19000), (4,'000000000901',6,7200),
(5,'000000000111',3,36000), (5,'000000000112',1,18000), (5,'000000000801',2,5600),
(6,'000000000112',1,18000), (6,'000000000201',3,8400), (6,'000000000501',2,4200),
(7,'000000000111',2,24000), (7,'000000000302',4,17200), (7,'000000000401',3,7500),
(8,'000000000113',3,28500), (8,'000000000501',6,12600),
(9,'000000000111',1,12000), (9,'000000000112',2,36000), (9,'000000000501',3,6300), (9,'000000000801',1,2800),
(10,'000000000112',1,18000), (10,'000000000301',3,9600),

-- Campus Corner transactions (energy drinks + snacks)
(11,'000000000403',4,14000), (11,'000000000501',5,10500),
(12,'000000000113',2,19000), (12,'000000000403',3,10500),
(13,'000000000403',6,21000), (13,'000000000503',4,19200), (13,'000000000901',1,1200),
(14,'000000000111',3,36000), (14,'000000000403',5,17500),
(15,'000000000501',8,16800), (15,'000000000503',6,28800),

-- Seoul Station transactions (coffee heavy + convenience items)
(16,'000000000111',4,48000), (16,'000000000801',5,14000),
(17,'000000000112',2,36000), (17,'000000000201',4,11200),
(18,'000000000111',5,60000), (18,'000000000801',3,8400), (18,'000000000901',1,1200),
(19,'000000000111',2,24000), (19,'000000000112',1,18000), (19,'000000000802',4,13600),
(20,'000000000111',3,36000), (20,'000000000112',1,18000), (20,'000000000501',1,2100),

-- Other stores
(21,'000000000111',1,12000), (21,'000000000301',3,9600),
(22,'000000000112',1,18000), (22,'000000000401',5,12500),
(23,'000000000111',2,24000), (23,'000000000302',4,17200),
(24,'000000000112',2,36000), (24,'000000000501',2,4200),
(25,'000000000111',1,12000), (25,'000000000401',5,12500),
(26,'000000000112',1,18000), (26,'000000000301',4,12800),
(27,'000000000403',8,28000), (27,'000000000501',12,25200),
(28,'000000000111',2,24000), (28,'000000000301',2,6400),
(29,'000000000112',1,18000), (29,'000000000401',3,7500),

-- Quarterly transactions (older data)
(30,'000000000111',4,48000), (30,'000000000112',1,18000), (30,'000000000501',5,10500),
(31,'000000000111',3,36000), (31,'000000000801',8,22400), (31,'000000000901',5,6000),
(32,'000000000111',5,60000), (32,'000000000112',1,18000), (32,'000000000301',2,6400),
(33,'000000000403',6,21000), (33,'000000000503',8,38400),
(34,'000000000111',6,72000), (34,'000000000112',1,18000), (34,'000000000801',2,5600),
(35,'000000000111',4,48000), (35,'000000000112',2,36000),
(36,'000000000111',2,24000), (36,'000000000301',7,22400),
(37,'000000000111',3,36000), (37,'000000000112',1,18000), (37,'000000000501',2,4200);

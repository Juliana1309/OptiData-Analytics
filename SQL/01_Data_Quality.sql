PRAGMA table_info (Customers);

SELECT *
FROM Customers;

PRAGMA table_info(Orders);

PRAGMA table_info(`Order Details`);

PRAGMA table_info(Products);

PRAGMA table_info(Categories);

SELECT 'Customers' AS table_name, COUNT(*) AS total_records
FROM Customers

UNION ALL

SELECT 'Orders', COUNT(*)
FROM Orders

UNION ALL

SELECT 'Order Details', COUNT(*)
FROM `Order Details`

UNION ALL

SELECT 'Products', COUNT(*)
FROM Products

UNION ALL

SELECT 'Categories', COUNT(*)
FROM Categories;

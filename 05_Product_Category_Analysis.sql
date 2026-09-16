
SELECT
    c.CategoryName AS categoria,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_ventas
FROM Categories c
INNER JOIN Products p
    ON c.CategoryID = p.CategoryID
INNER JOIN `Order Details` od
    ON p.ProductID = od.ProductID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY total_ventas DESC;


SELECT
    p.ProductName AS producto,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_ventas
FROM Products p
INNER JOIN `Order Details` od
    ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY total_ventas DESC
LIMIT 10;


SELECT *
FROM Products
LIMIT 1;
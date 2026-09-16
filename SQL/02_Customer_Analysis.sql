*//frecuencia compra cada cliente*//

SELECT 
    c.CustomerID,
    c.CompanyName,
    COUNT(o.OrderID) AS total_orders
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerID,
    c.CompanyName;

*// Valor monetario*//
SELECT 
    c.CustomerID,
    c.CompanyName,
    SUM(
        od.UnitPrice * od.Quantity * (1 - od.Discount)
    ) AS total_spent
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN `Order Details` od
    ON o.OrderID = od.OrderID
GROUP BY 
    c.CustomerID,
    c.CompanyName;


*//Pedido por cada cliente*//
SELECT 
    c.CustomerID,
    c.CompanyName,
    MAX(o.OrderDate) AS last_order_date
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName;

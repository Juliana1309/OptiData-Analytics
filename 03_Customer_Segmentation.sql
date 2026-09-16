*//ClASIFICACION DEL CLIENTE*//

WITH CustomerSegments AS (
    SELECT
        c.CustomerID,
        c.CompanyName,
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_spent
    FROM Customers c
    INNER JOIN Orders o
        ON c.CustomerID = o.CustomerID
    INNER JOIN `Order Details` od
        ON o.OrderID = od.OrderID
    GROUP BY
        c.CustomerID,
        c.CompanyName
),

SegmentedCustomers AS (
    SELECT
        CustomerID,
        CompanyName,
        total_spent,
        CASE
            WHEN total_spent >= 5000000 THEN 'Alto valor'
            WHEN total_spent >= 4500000 THEN 'Valor medio'
            ELSE 'Bajo valor'
        END AS customer_segment
    FROM CustomerSegments
)

SELECT *
FROM SegmentedCustomers;

//CONTAR CLIENTES POR SEGEMENTO*//
WITH CustomerSegments AS (
    SELECT
        c.CustomerID,
        c.CompanyName,
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_spent
    FROM Customers c
    INNER JOIN Orders o
        ON c.CustomerID = o.CustomerID
    INNER JOIN `Order Details` od
        ON o.OrderID = od.OrderID
    GROUP BY
        c.CustomerID,
        c.CompanyName
),

SegmentedCustomers AS (
    SELECT
        CustomerID,
        CompanyName,
        total_spent,
        CASE
            WHEN total_spent >= 5000000 THEN 'Alto valor'
            WHEN total_spent >= 4500000 THEN 'Valor medio'
            ELSE 'Bajo valor'
        END AS customer_segment
    FROM CustomerSegments
)

SELECT
    customer_segment,
    COUNT(*) AS total_customers
FROM SegmentedCustomers
GROUP BY customer_segment
ORDER BY total_customers DESC;

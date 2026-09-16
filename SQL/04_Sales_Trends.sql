*//VENTAS POR AÑO*//
SELECT 
    STRFTIME('%Y', o.OrderDate) AS año,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_ventas
FROM Orders o
INNER JOIN `Order Details` od
    ON o.OrderID = od.OrderID
GROUP BY STRFTIME('%Y', o.OrderDate)
ORDER BY año;

*//COMPARACION CON EL AÑO ANTERIOR*//
SELECT
    año,
    total_ventas,
    LAG(total_ventas) OVER (ORDER BY año) AS ventas_año_anterior
FROM (
    SELECT 
        STRFTIME('%Y', o.OrderDate) AS año,
        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_ventas
    FROM Orders o
    INNER JOIN `Order Details` od
        ON o.OrderID = od.OrderID
    GROUP BY STRFTIME('%Y', o.OrderDate)
);

*//VARACION PORCENTUAL*//
SELECT
    año,
    total_ventas,
    ventas_año_anterior,
    ROUND(
        ((total_ventas - ventas_año_anterior) / ventas_año_anterior) * 100,
        2
    ) AS variacion_porcentual
FROM (
    SELECT
        año,
        total_ventas,
        LAG(total_ventas) OVER (ORDER BY año) AS ventas_año_anterior
    FROM (
        SELECT 
            STRFTIME('%Y', o.OrderDate) AS año,
            SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS total_ventas
        FROM Orders o
        INNER JOIN `Order Details` od
            ON o.OrderID = od.OrderID
        GROUP BY STRFTIME('%Y', o.OrderDate)
    )
)
ORDER BY año;

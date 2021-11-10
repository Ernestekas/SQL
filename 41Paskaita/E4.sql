USE lessons;
-- Create a view that returns the total quantity for each employee and year.
-- 
--    Tables involved: Sales.Orders and Sales.OrderDetails.
--    When running the following code:

-- SELECT * FROM Sales.ViewEmployeeOrders ORDER BY empid, orderyear;

DROP VIEW IF EXISTS Sales.ViewEmployeeOrders;
GO
CREATE VIEW Sales.ViewEmployeeOrders
AS 
SELECT
    empid,
    YEAR(orderdate) AS orderyear,
    SUM(qty) AS qty
FROM Sales.Orders AS O
    INNER JOIN Sales.OrderDetails AS OD
    ON O.orderid = OD.orderid
GROUP BY empid, YEAR(orderdate)
GO

SELECT * FROM Sales.ViewEmployeeOrders ORDER BY empid, orderyear;

-- Write a query against Sales.ViewEmployeeOrders that returns the running total quantity (sum) for each employee and year.
SELECT empid, orderyear, qty,
    (SELECT SUM(qty)
    FROM Sales.ViewEmployeeOrders AS VEO2
    WHERE VEO1.empid = VEO2.empid
    AND VEO1.orderyear >= VEO2.orderyear) AS runqty
FROM Sales.ViewEmployeeOrders AS VEO1
ORDER BY empid, orderyear


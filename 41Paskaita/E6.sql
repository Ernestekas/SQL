USE lessons;

-- GET CUSTOMER ACTIVITY
SELECT custid, empid
FROM Sales.Orders
WHERE (YEAR(orderdate) = '2016' AND MONTH(orderdate) = '01')
EXCEPT
SELECT custid, empid
FROM Sales.Orders
WHERE (YEAR(orderdate) = '2016' AND MONTH(orderdate) = '02')


USE lessons;

SELECT custid, empid
FROM Sales.Orders
WHERE orderdate BETWEEN '20160101' AND '20160131'
INTERSECT
SELECT custid, empid
FROM Sales.Orders
WHERE orderdate BETWEEN '20160201' AND '20160228'
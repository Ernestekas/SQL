USE lessons;

-- Write a query that returns rows with row numbers 11 through 20 based on the row-number definition.
SELECT orderid, orderdate, custid, empid,
  ROW_NUMBER() OVER(ORDER BY orderdate, orderid) AS rownum
FROM Sales.Orders;

SELECT *
FROM 
    (SELECT orderid, orderdate, custid, empid,
    ROW_NUMBER() OVER(ORDER BY orderdate, orderid) AS rownum
    FROM Sales.Orders) AS T1
WHERE rownum BETWEEN 11 AND 20;
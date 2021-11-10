USE lessons;

-- The following query attempts to filter orders that were not placed on the last day of the year. 
-- It’s supposed to return the order ID, order date, customer ID, employee ID, 
-- and respective end-of-year date for each order:

SELECT orderid, orderdate, custid, empid,
  DATEFROMPARTS(YEAR(orderdate), 12, 31) AS endofyear
FROM Sales.Orders
WHERE orderdate <> endofyear;

-- When you try to run this query, you get the error. Explain what the problem is, and suggest a valid solution.
-- ANSWER: column_alias can be used in an ORDER BY clause, but it cannot be used in a WHERE
SELECT *
FROM 
    (SELECT orderid, orderdate, custid, empid,
    DATEFROMPARTS(YEAR(orderdate), 12, 31) AS endofyear
    FROM Sales.Orders) AS T1
WHERE orderdate <> endofyear
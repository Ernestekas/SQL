USE lessons;

-- Write a query that returns the maximum value in the orderdate column for each employee.
SELECT empid, MAX(orderdate) AS maxorderdate
FROM Sales.Orders
GROUP BY empid

-- Encapsulate the query that you get before in a derived table. Write a join query 
-- between the derived table and the Orders table to return the orders with the maximum order date for each employee.
SELECT O.empid, O.orderdate, O.orderid, O.custid
FROM Sales.Orders AS O
    INNER JOIN 
        (SELECT O1.empid, MAX(O1.orderdate) AS maxorderdate
        FROM Sales.Orders AS O1
        GROUP BY O1.empid) AS T1
    ON O.empid = T1.empid
    AND O.orderdate = T1.maxorderdate
    
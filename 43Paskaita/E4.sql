USE lessons;

-- Delete rows from table '[Orders]' in schema '[dbo]'
DELETE FROM [dbo].[Orders]
WHERE custid IN
    (SELECT C.custid
    FROM Sales.Customers AS C
    WHERE C.country = 'Brazil')
GO
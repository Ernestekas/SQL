USE lessons;

-- Delete rows from table '[Orders]' in schema '[dbo]'
DELETE FROM [dbo].[Orders]
    OUTPUT deleted.orderid, deleted.orderdate
WHERE orderdate < '20140801'
GO
USE lessons;

DELETE FROM [dbo].[Orders]
    OUTPUT deleted.orderid, deleted.orderdate
WHERE orderdate < '20140801'
GO
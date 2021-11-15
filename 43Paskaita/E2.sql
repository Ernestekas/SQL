USE lessons;

SELECT *
INTO [dbo].[Orders]
FROM [Sales].[Orders] AS SO
WHERE YEAR(SO.orderdate) BETWEEN '2014' AND '2016'
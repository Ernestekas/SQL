USE lessons;

SELECT * FROM dbo.Customers;

UPDATE C
SET
    C.custid = C.custid,
    C.region = '<None>'
    OUTPUT deleted.custid, deleted.region AS oldregion, inserted.region AS newregion
FROM [dbo].[Customers] AS C
WHERE C.region IS NULL
GO
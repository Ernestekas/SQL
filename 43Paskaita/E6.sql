USE lessons;

-- Update rows in table '[Orders]' in schema '[dbo]'
UPDATE O
SET
    O.shipcountry = C.country,
    O.shipregion = C.region,
    O.shipcity = C.city
FROM [dbo].[Orders] AS O
    INNER JOIN [dbo].[Customers] AS C
    ON O.custid = C.custid
WHERE C.country = 'UK'
GO





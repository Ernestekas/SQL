USE lessons;

DROP TABLE IF EXISTS dbo.Customers;

CREATE TABLE dbo.Customers
(
  custid      INT          NOT NULL PRIMARY KEY,
  companyname NVARCHAR(40) NOT NULL,
  country     NVARCHAR(15) NOT NULL,
  region      NVARCHAR(15) NULL,
  city        NVARCHAR(15) NOT NULL
);

INSERT INTO [dbo].[Customers]
( 
 [custid], [companyname], [country], [region], [city]
)
VALUES
(
 100, 'Coho Winery', 'USA', 'WA', 'Redmond'
)
GO

INSERT INTO [dbo].[Customers]
( 
 [custid], [companyname], [country], [region], [city]
)
SELECT C.custid, C.companyname, C.country, C.region, C.city
FROM Sales.Customers AS C
WHERE C.custid IN 
  (SELECT O.custid
  FROM SALES.Orders AS O)
USE lessons;

IF OBJECT_ID('[dbo].[Friends]', 'U') IS NOT NULL
DROP TABLE [dbo].[Friends]
GO
CREATE TABLE [dbo].[Friends]
(
    [Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NOT NULL,
    [City] NVARCHAR(50) NOT NULL
);
GO

CREATE UNIQUE INDEX [index1] ON [dbo].[Friends]([Name] DESC);

DROP INDEX [index1] ON [dbo].[Friends]
GO

CREATE UNIQUE INDEX [index2] ON [dbo].[Friends]([City] ASC);
DROP INDEX [index2] ON [dbo].[Friends]
GO

EXEC sp_helpindex 'Sales.Customers'
GO
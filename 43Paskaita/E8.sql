USE lessons;

INSERT INTO [dbo].[Departments1]([deptid], [deptname], [mgrid])
VALUES
(1, 'HR', 7),
(2, 'IT', 5),
(3, 'SALES', 11),
(4, 'MARKETING', 13)
GO

SELECT *
FROM dbo.Departments1History

UPDATE [dbo].[Departments1]
SET
    [mgrid] = 13
WHERE [deptid] = 3
GO

SELECT *
FROM dbo.Departments1History

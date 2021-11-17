USE lessons;

WITH F AS (
    SELECT 0 i UNION ALL
    SELECT i+1 i FROM F WHERE i < 5
)
SELECT i AS [Number] FROM F


DROP FUNCTION IF EXISTS dbo.NumbersRange;
GO
CREATE FUNCTION dbo.NumbersRange
(
    @start INT = 1,
    @end INT = 1
)
RETURNS TABLE
AS
RETURN
    WITH F AS 
    (
    SELECT 
        CASE
            WHEN @start > @end 
            THEN @end
            ELSE @start
        END AS i 
    UNION ALL
    SELECT i+1 i FROM F 
    WHERE i < CASE 
                WHEN @start > @end 
                THEN @start
                ELSE @end
            END
    )
    SELECT i AS [Number] FROM F 
    WHERE 1 = 1
GO

SELECT * FROM dbo.NumbersRange(1, 5);
SELECT * FROM dbo.NumbersRange(default, default);
SELECT * FROM dbo.NumbersRange(5, 1);

-- PROCEDURE
DROP PROCEDURE IF EXISTS dbo.NumbersRangeProc
GO

CREATE PROCEDURE dbo.NumbersRangeProc
    @start INT = 1,
    @end INT = 1
AS
BEGIN
    DECLARE @t TABLE(Number INT);
    WITH F AS 
    (
    SELECT 
        CASE
            WHEN @start > @end 
            THEN @end
            ELSE @start
        END AS i 
    UNION ALL
    SELECT i+1 i FROM F 
    WHERE i < CASE 
                WHEN @start > @end 
                THEN @start
                ELSE @end
            END
    )
    SELECT i AS [Number] FROM F 
    WHERE 1 = 1
END
GO

DECLARE @Values AS TABLE([Number] INT);
INSERT @Values EXEC dbo.NumbersRangeProc 1, 5;
SELECT * FROM  @Values;

DECLARE @Values1 AS TABLE([Number] INT);
INSERT @Values1 EXEC dbo.NumbersRangeProc 5, 1;
SELECT * FROM  @Values1;

DECLARE @Values2 AS TABLE([Number] INT);
INSERT @Values2 EXEC dbo.NumbersRangeProc;
SELECT * FROM  @Values2;

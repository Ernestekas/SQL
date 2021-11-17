USE lessons;

CREATE TABLE dbo.Departments1
(
    deptid INT NOT NULL PRIMARY KEY,
    deptname VARCHAR(25) NOT NULL,
    mgrid INT NOT NULL,
    validfrom DATETIME2(0)
        GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    validto DATETIME2(0)
        GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
    PERIOD FOR SYSTEM_TIME (validfrom, validto)
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = dbo.Departments1History));
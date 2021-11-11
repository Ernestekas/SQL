USE lessons;

ALTER TABLE [dbo].[employees]
DROP COLUMN [employeeId];

ALTER TABLE [dbo].[employees]
ADD [employeeId] INT IDENTITY(1,1) PRIMARY KEY NOT NULL 

-- Insert rows into table 'employees' in schema '[dbo]'
INSERT INTO [dbo].[employees]
( -- Columns to insert data into
 [firstName], [lastName], [dateOfBirth], [phoneNumber], [email], [salary]
)
VALUES
( -- First row: values for the columns in the list above
 'Julie', 'Juliette', '1990-01-01', '0-800-900-111', 'julie@juliette.com', 5000
),
( -- Second row: values for the columns in the list above
 'Sofie', 'Sophia', '1987-02-03', '0-800-900-222', 'sofie@sophia.com', 1700
)
-- Add more rows here
GO

-- Create a new table called '[Departments]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[Departments]', 'U') IS NOT NULL
DROP TABLE [dbo].[Departments]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Departments]
(
    [departmentId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Primary Key column
    [name] NVARCHAR(50) NOT NULL
);
GO

-- Add a new column '[NewColumnName]' to table '[TableName]' in schema '[dbo]'
-- Insert rows into table 'Departments' in schema '[dbo]'
INSERT INTO [dbo].[Departments]
( -- Columns to insert data into
 [name]
)
VALUES
( -- First row: values for the columns in the list above
 'HR'
),
( -- Second row: values for the columns in the list above
 'Finance'
)
GO

-- Add a new column '[departmentId]' to table '[employees]' in schema '[dbo]'
ALTER TABLE [dbo].[employees]
    ADD [departmentId] INT
GO

UPDATE [dbo].[employees]
SET
    [departmentId] = 1
WHERE [firstName] = 'John'
GO

UPDATE [dbo].[employees]
SET
    [departmentId] = 2
WHERE [firstName] = 'Julie'
GO

ALTER TABLE [dbo].[employees]
ADD FOREIGN KEY (departmentId) REFERENCES [dbo].[Departments](departmentId);

DELETE FROM [dbo].[Departments]
WHERE [name] = 'HR';
-- Can't delete, because departmentId is Referenced in another table.


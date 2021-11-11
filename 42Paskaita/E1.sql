USE lessons;

-- Create a new table called '[employees]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[employees]', 'U') IS NOT NULL
DROP TABLE [dbo].[employees]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[employees]
(
    [employeeId] INT NOT NULL,
    [firstName] VARCHAR(50) NOT NULL,
    [lastName] VARCHAR(50) NOT NULL,
    [dateOfBirth] Date,
    [postalAddress] VARCHAR(150),
    -- Specify more columns here
);
GO

-- Add a new column '[phoneNumber]' to table '[employees]' in schema '[dbo]'
ALTER TABLE [dbo].[employees]
    ADD [phoneNumber] VARCHAR(50),
        [email] VARCHAR(50),
        [salary] INT;
GO

-- Drop '[postalAddress]' from table '[employees]' in schema '[dbo]'
ALTER TABLE [dbo].[employees]
    DROP COLUMN [postalAddress]
GO

-- Create a new table called '[employeeAddresses]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[employeeAddresses]', 'U') IS NOT NULL
DROP TABLE [dbo].[employeeAddresses]
GO

-- Create the table in the specified schema
CREATE TABLE [dbo].[employeeAddresses]
(
    [country] VARCHAR(50)
);
GO

-- Drop a table called 'employeeAddresses' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[employeeAddresses]', 'U') IS NOT NULL
DROP TABLE [dbo].[employeeAddresses]
GO
USE lessons;

-- Insert rows into table 'employees' in schema '[dbo]'
INSERT INTO [dbo].[employees]
( -- Columns to insert data into
 [employeeId], [firstName], [lastName], [dateOfBirth], [phoneNumber], [email], [salary]
)
VALUES
( -- First row: values for the columns in the list above
 1, 'John', 'Johnson', '1975-01-01', '0-800-800-314', 'john@johnson.com', 1000
)
-- Add more rows here
GO

-- Update rows in table '[employees]' in schema '[dbo]'
UPDATE [dbo].[employees]
SET
    [dateOfBirth] = '1980-01-01'
    -- Add more columns and values here
GO

-- Delete rows from table '[employees]' in schema '[dbo]'
DELETE FROM [dbo].[employees]
GO

-- Insert rows into table 'employees' in schema '[dbo]'
INSERT INTO [dbo].[employees]
( -- Columns to insert data into
 [employeeId], [firstName], [lastName], [dateOfBirth], [phoneNumber], [email], [salary]
)
VALUES
( -- First row: values for the columns in the list above
 1, 'John', 'Johnson', '1975-01-01', '0-800-800-888', 'john@johnson.com', 1000
),
( -- Second row: values for the columns in the list above
 2, 'James', 'Jameson', '1985-02-02', '0-800-800-999', 'james@jameson.com', 2000
)
GO
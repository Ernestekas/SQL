USE lessons;


SELECT *
FROM dbo.FakeEgzas

IF OBJECT_ID('[dbo].[FakeEgzas]', 'U') IS NOT NULL
DROP TABLE [dbo].[FakeEgzas]
GO

CREATE TABLE [dbo].[FakeEgzas]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [name] NVARCHAR(50) NOT NULL,
    [surname] NVARCHAR(50) NOT NULL,
    [course] NVARCHAR(50) NOT NULL,
    [lecture] NVARCHAR(50) NOT NULL
);
GO

-- Insert rows into table 'FakeEgzas' in schema '[dbo]'
INSERT INTO [dbo].[FakeEgzas]
( -- Columns to insert data into
 [name], [surname], [course], [lecture]
)
VALUES
( -- First row: values for the columns in the list above
 'Jonas', 'Jonaitis', 'VI', 'Java'
),
( -- First row: values for the columns in the list above
 'Juozas', 'Juozaitis', 'III', 'PHP'
),
( -- First row: values for the columns in the list above
 'Berzas', 'Bezaitis', 'III', 'Java'
),
( -- First row: values for the columns in the list above
 'Pertras', 'Petraitis', 'III', 'Java'
),
( -- First row: values for the columns in the list above
 'Mindaugas', 'Mindaugelis', 'IV', 'PHP'
),
( -- First row: values for the columns in the list above
 'Simonas', 'Simonauskas', 'IV', 'PHP'
),
( -- First row: values for the columns in the list above
 'Giedrius', 'Giedrauskas', 'IV', 'PHP'
)
-- Add more rows here
GO


SELECT T.course
FROM
    (SELECT TOP 1 course, COUNT(course) AS max
    FROM dbo.FakeEgzas
    GROUP BY course
    ORDER BY course DESC) AS T

-- 
-- Kursai ir populiariausi lecture

select course
FROM dbo.FakeEgzas AS T1
WHERE lecture IN
    (SELECT lecture
    FROM 
        (SELECT TOP 1 lecture, COUNT(lecture) as lc
        FROM dbo.FakeEgzas
        WHERE course = T1.course 
        GROUP BY lecture
        ORDER BY COUNT(lecture) DESC) AS T2)
AND lecture = 'Java'
GROUP BY course


select course
FROM dbo.FakeEgzas AS T1
WHERE lecture IN
    (SELECT lecture
    FROM 
        (SELECT TOP 1 lecture, COUNT(lecture) as lc
        FROM dbo.FakeEgzas
        WHERE course = T1.course 
        GROUP BY lecture
        ORDER BY COUNT(lecture) DESC) AS T2)
AND lecture = 'PHP'
GROUP BY course

SELECT *
FROM dbo.FakeEgzas
GROUP BY Id, name, surname, course, lecture
ORDER BY MAX(lecture), MAX(course) ASC





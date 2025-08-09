CREATE TABLE Person (
	id INT PRIMARY KEY,
	email VARCHAR(20)
);

INSERT INTO Person (id, email) 
VALUES
    (1, 'joe@example.com'),
    (2, 'henry@example.com'),
    (3, 'sam@example.com'),
    (4, 'joe@example.com'),  -- Duplicate email
    (5, 'max@example.com'),
    (6, 'henry@example.com'),  -- Duplicate email
    (7, 'lucy@example.com'),
    (8, 'joe@example.com'),  -- Duplicate email
    (9, 'sam@example.com'),  -- Duplicate email
    (10, 'anna@example.com');

-- Report Duplicate Emails (Unique)
WITH rank_of_email AS (
	SELECT *, ROW_NUMBER() OVER(PARTITION BY email) AS rnk
	FROM Person
)
SELECT DISTINCT email
FROM rank_of_email
WHERE rnk > 1;

-- Or
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

-- Clear Resources
DROP TABLE Person;
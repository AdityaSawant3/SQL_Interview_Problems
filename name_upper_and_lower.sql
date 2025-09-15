-- Create table and insert data in a single batch
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name NVARCHAR(100)
);

INSERT INTO Users (user_id, name)
VALUES 
    (1, 'aLice'),
    (2, 'bOB');

/*
Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.*/
SELECT
	user_id,
	LEFT(UPPER(name), 1) + RIGHT(LOWER(name), LEN(name)-1) AS name
FROM Users
ORDER BY user_id;

DROP TABLE Users;
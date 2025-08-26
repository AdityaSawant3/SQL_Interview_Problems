-- Drop tables if they already exist (optional)
IF OBJECT_ID('Register', 'U') IS NOT NULL DROP TABLE Register;
IF OBJECT_ID('Users', 'U') IS NOT NULL DROP TABLE Users;

-- Create Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name NVARCHAR(100)
);

-- Create Register table
CREATE TABLE Register (
    contest_id INT,
    user_id INT FOREIGN KEY REFERENCES Users(user_id)
);

-- Insert data into Users
INSERT INTO Users (user_id, user_name) VALUES
(6, 'Alice'),
(2, 'Bob'),
(7, 'Alex');

-- Insert data into Register
INSERT INTO Register (contest_id, user_id) VALUES
(215, 6),
(209, 2),
(208, 2),
(210, 6),
(208, 6),
(209, 7),
(209, 6),
(215, 7),
(208, 7),
(210, 2),
(207, 2),
(210, 7);

/*
Write a solution to find the percentage of the users registered in each contest rounded to two decimals.

Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.
*/

SELECT
	contest_id,
	CAST(COUNT(DISTINCT user_id) * 100.0 / (SELECT COUNT(user_id) FROM Users) AS DECIMAL(5, 2)) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;

-- Release Resources.
DROP TABLE Users;
DROP TABLE Register;
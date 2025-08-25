-- Create the Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name NVARCHAR(100),
    mail NVARCHAR(100)
);

-- Insert data into Users table
INSERT INTO Users (user_id, name, mail)
VALUES
(1, 'Winston', 'winston@leetcode.com'),
(2, 'Jonathan', 'jonathanisgreat'),
(3, 'Annabelle', 'bella-@leetcode.com'),
(4, 'Sally', 'sally.come@leetcode.com'),
(5, 'Marwan', 'quarz#2020@leetcode.com'),
(6, 'David', 'david69@gmail.com'),
(7, 'Shapiro', '.shapo@leetcode.com');

/*
Write a solution to find the users who have valid emails.

A valid e-mail has a prefix name and a domain where:

- The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'. 
- The prefix name must start with a letter.
- The domain is '@leetcode.com'.
*/

SELECT *
FROM Users
WHERE 
    mail COLLATE Latin1_General_CI_AS LIKE '_%@leetcode.com' -- at least one char before '@leetcode.com'
    AND PATINDEX('[a-zA-Z]%', mail) = 1 -- starts with a letter
    AND PATINDEX('%[^a-zA-Z0-9._-]%', LEFT(mail, CHARINDEX('@', mail) - 1)) = 0; -- only valid chars before @

DROP TABLE Users;
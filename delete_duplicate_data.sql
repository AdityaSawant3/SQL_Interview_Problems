-- Create the Person table
CREATE TABLE Person (
    id INT,
    email VARCHAR(255)
);

-- Insert the data
INSERT INTO Person (id, email) VALUES (1, 'john@example.com');
INSERT INTO Person (id, email) VALUES (2, 'bob@example.com');
INSERT INTO Person (id, email) VALUES (3, 'john@example.com');

-- Delete duplicate data (Easy).
DELETE FROM Person
WHERE id NOT IN (
	SELECT MIN(id) AS min_id
	FROM Person
	GROUP BY email
); 

SELECT * FROM Person;

DROP TABLE Person;
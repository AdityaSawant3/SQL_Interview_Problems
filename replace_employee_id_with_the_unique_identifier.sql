-- Create Employees table
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Create EmployeeUNI table
CREATE TABLE EmployeeUNI (
    id INT,
    unique_id INT
);

INSERT INTO Employees (id, name) VALUES
(1, 'Alice'),
(7, 'Bob'),
(11, 'Meir'),
(90, 'Winston'),
(3, 'Jonathan');

INSERT INTO EmployeeUNI (id, unique_id) VALUES
(3, 1),
(11, 2),
(90, 3);

-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
SELECT
    eu.unique_id,
    e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu ON e.id = eu.id
ORDER BY eu.unique_id;

-- Release resources
DROP TABLE Employees;
DROP TABLE EmployeeUNI;
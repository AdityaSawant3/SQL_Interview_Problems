-- Create the Employee table
CREATE TABLE Employee (
    employee_id INT,
    name VARCHAR(50),
    experience_years INT
);

-- Insert data into Employee table
INSERT INTO Employee (employee_id, name, experience_years) VALUES
(1, 'Khaled', 3),
(2, 'Ali', 2),
(3, 'John', 1),
(4, 'Doe', 2);

-- Create the Project table
CREATE TABLE Project (
    project_id INT,
    employee_id INT
);

-- Insert data into Project table
INSERT INTO Project (project_id, employee_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4);

-- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits. (Easy)
SELECT p.project_id, ROUND(AVG(CAST(e.experience_years AS FLOAT)), 2) AS average_years
FROM Employee e
LEFT JOIN Project p ON e.employee_id = p.employee_id
WHERE e.experience_years IS NOT NULL
GROUP BY p.project_id;

-- Release resources
DROP TABLE Employee;

DROP TABLE Project;
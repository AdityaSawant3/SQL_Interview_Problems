CREATE TABLE Employee (
    empId INT PRIMARY KEY,
    name VARCHAR(50),
    supervisor INT,
    salary INT
);

CREATE TABLE Bonus (
    empId INT,
    bonus INT,
    FOREIGN KEY (empId) REFERENCES Employee(empId)
);

INSERT INTO Employee (empId, name, supervisor, salary) VALUES
(3, 'Alice', NULL, 4000),
(1, 'Michael', 3, 1200),
(2, 'Sarah', 1, 2000),
(4, 'David', 3, 3500);

INSERT INTO Bonus (empId, bonus) VALUES
(2, 750),
(4, 2500);

-- name and bonus amount of each employee with a bonus less than 1000. (Easy)
SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;

-- release resources.
DROP TABLE Employee;
DROP TABLE Bonus;
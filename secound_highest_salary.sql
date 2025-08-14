CREATE TABLE Employee (
    id INT PRIMARY KEY,
    salary INT
);

INSERT INTO Employee (id, salary)
VALUES
(1, 100),
(2, 200),
(3, 300),
(4, 600),
(5, 1200),
(6, 4300);

-- Find the second highest distinct salary from the Employee table. If there is no second highest salary, return null.
SELECT salary AS SecondHighestSalary
FROM Employee
ORDER BY salary DESC
OFFSET 1 ROWS
FETCH NEXT 1 ROWS ONLY;

-- Release resource
DROP TABLE Employee;
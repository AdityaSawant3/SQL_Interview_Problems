-- Drop tables if they already exist (optional for re-running the script)
IF OBJECT_ID('Orders') IS NOT NULL DROP TABLE Orders;
IF OBJECT_ID('Company') IS NOT NULL DROP TABLE Company;
IF OBJECT_ID('SalesPerson') IS NOT NULL DROP TABLE SalesPerson;

-- Create SalesPerson table
CREATE TABLE SalesPerson (
    sales_id INT PRIMARY KEY,
    name NVARCHAR(50),
    salary INT,
    commission_rate INT,
    hire_date DATE
);

-- Insert data into SalesPerson
INSERT INTO SalesPerson (sales_id, name, salary, commission_rate, hire_date)
VALUES 
(1, 'John', 100000, 6, '2006-04-01'),
(2, 'Amy', 12000, 5, '2010-05-01'),
(3, 'Mark', 65000, 12, '2008-12-25'),
(4, 'Pam', 25000, 25, '2005-01-01'),
(5, 'Alex', 5000, 10, '2007-02-03');

-- Create Company table
CREATE TABLE Company (
    com_id INT PRIMARY KEY,
    name NVARCHAR(50),
    city NVARCHAR(50)
);

-- Insert data into Company
INSERT INTO Company (com_id, name, city)
VALUES 
(1, 'RED', 'Boston'),
(2, 'ORANGE', 'New York'),
(3, 'YELLOW', 'Boston'),
(4, 'GREEN', 'Austin');

-- Create Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    com_id INT FOREIGN KEY REFERENCES Company(com_id),
    sales_id INT FOREIGN KEY REFERENCES SalesPerson(sales_id),
    amount INT
);

-- Insert data into Orders
INSERT INTO Orders (order_id, order_date, com_id, sales_id, amount)
VALUES 
(1, '2014-01-01', 3, 4, 10000),
(2, '2014-02-01', 4, 5, 5000),
(3, '2014-03-01', 1, 1, 50000),
(4, '2014-04-01', 1, 4, 25000);

-- Find the names of all the salespersons who did not have any orders related to the company with the name "RED".
SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (
	SELECT s.sales_id
	FROM SalesPerson s
	JOIN Orders o ON s.sales_id = o.sales_id
	JOIN Company c ON o.com_id = c.com_id
	WHERE c.name = 'RED'
);

-- Release resources
DROP TABLE SalesPerson;
DROP TABLE Orders;
DROP TABLE Company;
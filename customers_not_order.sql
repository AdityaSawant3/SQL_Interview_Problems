CREATE TABLE Customers (
	id INT PRIMARY KEY,
	name VARCHAR(20)
);

CREATE TABLE Orders (
	id INT PRIMARY KEY,
	customerId INT,
	FOREIGN KEY(customerId) REFERENCES Customers(id)
);

INSERT INTO customers (id, name) 
VALUES
    (1, 'Joe'),
    (2, 'Henry'),
    (3, 'Sam'),
    (4, 'Max');


INSERT INTO orders (id, customerId)
VALUES
    (1, 3),
    (2, 1);

-- Customers who never order. (Easy)
SELECT c.id, c.name, o.customerId
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.customerId IS NULL;


-- Clear resources
DROP TABLE Customers;
DROP TABLE Orders;
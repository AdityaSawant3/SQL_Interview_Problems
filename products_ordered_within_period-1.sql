-- Create Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_category VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    product_id INT,
    order_date DATE,
    unit INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_id, product_name, product_category) VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt');

-- Better: no dashes
INSERT INTO Orders (product_id, order_date, unit) VALUES
(1, '20200205', 60),
(1, '20200210', 70),
(2, '20200118', 30),
(2, '20200211', 80),
(3, '20200217', 2),
(3, '20200224', 3),
(4, '20200301', 20),
(4, '20200304', 30),
(4, '20200304', 60),
(5, '20200225', 50),
(5, '20200227', 50),
(5, '20200301', 50);

-- Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.
SELECT
    p.product_name, SUM(o.unit) AS unit
FROM Products p
LEFT JOIN Orders o ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100
ORDER BY unit DESC;

-- Release resources.
DROP TABLE Products;
DROP TABLE Orders;
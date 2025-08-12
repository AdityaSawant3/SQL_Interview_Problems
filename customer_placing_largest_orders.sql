CREATE TABLE Orders (
    order_number INT PRIMARY KEY,
    customer_number INT
);

INSERT INTO Orders (order_number, customer_number)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 3);

-- Find the customer_number for the customer who has placed the largest number of orders.
SELECT TOP 1 customer_number AS customer_number
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC;

-- Release resources.
DROP TABLE Orders
-- Create the Visits table
CREATE TABLE Visits (
    visit_id INT PRIMARY KEY,
    customer_id INT
);

-- Insert data into Visits
INSERT INTO Visits (visit_id, customer_id)
VALUES
(1, 23),
(2, 9),
(4, 30),
(5, 54),
(6, 96),
(7, 54),
(8, 54);

-- Create the Transactions table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    visit_id INT,
    amount INT,
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id)
);

-- Insert data into Transactions
INSERT INTO Transactions (transaction_id, visit_id, amount)
VALUES
(2, 5, 310),
(3, 5, 300),
(9, 5, 200),
(12, 1, 910),
(13, 2, 970);

-- Write a solution to find the IDs of the users who visited without making any transactions and 
-- the number of times they made these types of visits.

SELECT v.customer_id, COUNT(v.visit_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id
ORDER BY count_no_trans DESC;

-- Release Resources
DROP TABLE Visits;
DROP TABLE Transactions;
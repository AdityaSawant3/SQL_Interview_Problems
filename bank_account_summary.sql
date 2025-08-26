-- Drop tables if they already exist (optional, for re-running the script)
IF OBJECT_ID('Transactions', 'U') IS NOT NULL DROP TABLE Transactions;
IF OBJECT_ID('Accounts', 'U') IS NOT NULL DROP TABLE Accounts;

-- Create Accounts table
CREATE TABLE Accounts (
    account INT PRIMARY KEY,
    name NVARCHAR(100)
);

-- Create Transactions table
CREATE TABLE Transactions (
    trans_id INT PRIMARY KEY,
    account INT FOREIGN KEY REFERENCES Accounts(account),
    amount INT,
    transacted_on DATE
);

-- Insert data into Accounts
INSERT INTO Accounts (account, name) VALUES
(900001, 'Alice'),
(900002, 'Bob'),
(900003, 'Charlie');

-- Insert data into Transactions
INSERT INTO Transactions (trans_id, account, amount, transacted_on) VALUES
(1, 900001, 7000, '2020-08-01'),
(2, 900001, 7000, '2020-09-01'),
(3, 900001, -3000, '2020-09-02'),
(4, 900002, 1000, '2020-09-12'),
(5, 900003, 6000, '2020-08-07'),
(6, 900003, 6000, '2020-09-07'),
(7, 900003, -4000, '2020-09-11');

/*
Write a solution to report the name and balance of users with a balance higher than 10000.
The balance of an account is equal to the sum of the amounts of all transactions involving that account.
*/
SELECT
	a.name,
	SUM(t.amount) AS balance
FROM Accounts a
LEFT JOIN Transactions t ON a.account = t.account
GROUP BY a.name
HAVING SUM(t.amount) > 10000
ORDER BY balance DESC

DROP TABLE Accounts;
DROP TABLE Transactions;
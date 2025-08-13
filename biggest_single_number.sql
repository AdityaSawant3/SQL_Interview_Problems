-- Create Nums1 table
CREATE TABLE Nums1 (
    num INT
);

-- Insert data into Nums1
INSERT INTO Nums1 (num)
VALUES 
    (8),
    (8),
    (3),
    (3),
    (1),
    (4),
    (5),
    (6);

-- Create Nums2 table
CREATE TABLE Nums2 (
    num INT
);

-- Insert data into Nums2
INSERT INTO Nums2 (num)
VALUES 
    (8),
    (8),
    (7),
    (7),
    (3),
    (3),
    (3);

-- A single number is a number that appeared only once in the Nums table.
-- Find the largest single number. If there is no single number, report null.

SELECT TOP 1 CASE WHEN COUNT(num) = 1 THEN num ELSE NULL END AS num
FROM Nums1
GROUP BY num
ORDER BY num DESC;

SELECT TOP 1 CASE WHEN COUNT(num) = 1 THEN num ELSE NULL END AS num
FROM Nums2
GROUP BY num
ORDER BY num DESC;

DROP TABLE Nums1;
DROP TABLE Nums2;
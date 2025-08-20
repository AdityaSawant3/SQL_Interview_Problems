CREATE TABLE Queries (
    query_name VARCHAR(50),
    result VARCHAR(100),
    position INT,
    rating INT
);

INSERT INTO Queries (query_name, result, position, rating) VALUES
('Dog', 'Golden Retriever', 1, 5),
('Dog', 'German Shepherd', 2, 5),
('Dog', 'Mule', 200, 1),
('Cat', 'Shirazi', 5, 2),
('Cat', 'Siamese', 3, 3),
('Cat', 'Sphynx', 7, 4);


-- We define query quality as: The average of the ratio between query rating and its position.
-- We also define poor query percentage as: The percentage of all queries with rating less than 3.
-- Write a solution to find each query_name, the quality and poor_query_percentage.
-- Both quality and poor_query_percentage should be rounded to 2 decimal places.

SELECT 
	query_name, 
	CAST(ROUND(AVG(rating*1.0/position), 2)AS DECIMAL(5,2)) AS quality,
	CAST(ROUND(COUNT(CASE WHEN rating < 3 THEN rating END) * 1.0/COUNT(*) * 100, 2) AS DECIMAL(5,2)) AS poor_query_percentage
FROM Queries
GROUP BY query_name
ORDER BY quality DESC;

DROP TABLE Queries;
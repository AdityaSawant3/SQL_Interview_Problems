CREATE TABLE Activity (
    machine_id INT,
    process_id INT,
    activity_type VARCHAR(10),
    timestamp FLOAT
);


INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES
(0, 0, 'start', 0.712),
(0, 0, 'end', 1.520),
(0, 1, 'start', 3.140),
(0, 1, 'end', 4.120),
(1, 0, 'start', 0.550),
(1, 0, 'end', 1.550),
(1, 1, 'start', 0.430),
(1, 1, 'end', 1.420),
(2, 0, 'start', 4.100),
(2, 0, 'end', 4.512),
(2, 1, 'start', 2.500),
(2, 1, 'end', 5.000);

/*There is a factory website that has several machines each running the same number of processes. 
Write a solution to find the average time each machine takes to complete a process.*/
WITH start_cte AS (
	SELECT 
		machine_id,
		timestamp AS start_time,
		ROW_NUMBER() OVER (PARTITION BY machine_id ORDER BY timestamp) AS rn
	FROM Activity
	WHERE activity_type = 'start'
), end_cte AS (
	SELECT
		machine_id,
		timestamp AS end_time,
		ROW_NUMBER() OVER (PARTITION BY machine_id ORDER BY timestamp) AS rn
	FROM Activity
	WHERE activity_type = 'end'
), paired_cte AS (
	SELECT
		s.machine_id,
		(e.end_time - s.start_time) AS duration
	FROM start_cte s
	LEFT JOIN end_cte e ON s.machine_id = e.machine_id
), avg_processing_time AS (
	SELECT
		machine_id,
		ROUND(AVG(duration), 3) AS processing_time 
	FROM paired_cte
	GROUP BY machine_id
)
SELECT * FROM avg_processing_time
ORDER BY processing_time;

-- RELEASE RESOURCES.
DROP TABLE Activity;
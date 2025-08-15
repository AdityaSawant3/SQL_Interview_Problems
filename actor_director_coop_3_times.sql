-- Create ActorDirector table
CREATE TABLE ActorDirector (
    actor_id INT,
    director_id INT,
    timestamp INT
);

-- Insert data into ActorDirector
INSERT INTO ActorDirector (actor_id, director_id, timestamp)
VALUES
    (1, 1, 0),
    (1, 1, 1),
    (1, 1, 2),
    (1, 2, 3),
    (1, 2, 4),
    (2, 1, 5),
    (2, 1, 6);

-- Find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;

-- Release resources
DROP TABLE ActorDirector;
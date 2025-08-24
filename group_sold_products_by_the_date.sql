-- Create the table
CREATE TABLE Activities (
    sell_date DATE,
    product VARCHAR(50)
);

-- Insert the data
INSERT INTO Activities (sell_date, product) VALUES
('2020-05-30', 'Headphone'),
('2020-06-01', 'Pencil'),
('2020-06-02', 'Mask'),
('2020-05-30', 'Basketball'),
('2020-06-01', 'Bible'),
('2020-06-02', 'Mask'),
('2020-05-30', 'T-Shirt');

-- Write a solution to find for each date the number of different products sold and their names.
-- The sold products names for each date should be sorted lexicographically.
-- Return the result table ordered by sell_date.

WITH distinct_date_and_product AS (
	SELECT
		DISTINCT sell_date, product
	FROM
		activities
)
SELECT
	sell_date,
	COUNT(DISTINCT product) AS num_sold,
	STRING_AGG(product, ',')  WITHIN GROUP (ORDER BY product) AS products
FROM
	distinct_date_and_product
GROUP BY
	sell_date
ORDER BY
	sell_date; 

-- Release resources.
DROP TABLE Activities;
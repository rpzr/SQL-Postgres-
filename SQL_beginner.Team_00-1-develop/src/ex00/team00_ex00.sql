CREATE TABLE tours (
    point1 VARCHAR,
    point2 VARCHAR,
    cost INTEGER
);

INSERT INTO
    tours
VALUES ('A', 'B', 10),
    ('B', 'A', 10),
    ('A', 'C', 15),
    ('C', 'A', 15),
    ('A', 'D', 20),
    ('D', 'A', 20),
    ('D', 'B', 25),
    ('B', 'D', 25),
    ('D', 'C', 30),
    ('C', 'D', 30),
    ('B', 'C', 35),
    ('C', 'B', 35);

WITH RECURSIVE
    paths AS (
        SELECT
            point1 AS tour,
            point1 AS current_point,
            0 AS total_cost
        FROM tours
        WHERE
            point1 = 'A'
        UNION
        SELECT
            tour || ',' || tours.point2,
            tours.point2 AS current_point,
            (total_cost + tours.cost) AS total_cost
        FROM paths
            JOIN tours ON paths.current_point = tours.point1
        WHERE
            tour !~ (',' || tours.point2 || ',')
    )
SELECT total_cost, ('{' || tour || '}') AS tour
FROM paths
WHERE
    total_cost = (
        SELECT MIN(total_cost)
        FROM paths
        WHERE
            LENGTH(tour) = 9
            AND current_point = 'A'
    )
    AND LENGTH(tour) = 9
    AND current_point = 'A'
ORDER BY 1, 2;
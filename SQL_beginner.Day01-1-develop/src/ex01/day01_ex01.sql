SELECT object_name
FROM (SELECT pizza_name AS object_name, '2' AS mark FROM menu
UNION ALL
SELECT name AS object_name, '1' AS mark FROM person) AS objects
ORDER BY mark ASC, object_name;
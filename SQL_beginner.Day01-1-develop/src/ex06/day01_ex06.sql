SELECT action_date, person.name AS person_name
FROM (SELECT order_date AS action_date, person_id
FROM person_order, person
INTERSECT
SELECT visit_date AS action_date, person_id
FROM person_visits) as obj
INNER JOIN person ON person_id = person.id
ORDER BY action_date ASC, person_name DESC;
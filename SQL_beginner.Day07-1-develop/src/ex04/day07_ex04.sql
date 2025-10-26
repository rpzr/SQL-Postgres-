SELECT name, COUNT(visit_date) AS count_of_visits
FROM person
    JOIN person_visits ON person_visits.person_id = person.id
GROUP BY
    name
HAVING
    COUNT(visit_date) > 3;
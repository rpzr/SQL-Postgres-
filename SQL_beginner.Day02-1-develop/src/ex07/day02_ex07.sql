SELECT pizzeria.name
FROM
    pizzeria
    JOIN menu ON pizzeria.id = menu.pizzeria_id
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person.id = person_visits.person_id
WHERE
    person.name LIKE 'Dmitriy'
    AND menu.price < 800
    AND person_visits.visit_date = '2022-01-08'
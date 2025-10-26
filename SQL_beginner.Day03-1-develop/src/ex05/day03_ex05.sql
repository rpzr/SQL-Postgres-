SELECT pizzeria.name
FROM
    person_visits
    FULL JOIN person ON person_visits.person_id = person.id
    FULL JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    FULL JOIN person_order ON person_visits.visit_date = person_order.order_date
WHERE
    person.name = 'Andrey'
    AND person_order.menu_id IS NULL
SELECT person.name
FROM
    person
    JOIN person_order ON person.id = person_order.person_id
    JOIN menu ON person_order.menu_id = menu.id
WHERE
    gender = 'female'
    AND (
        menu.pizza_name IN (
            'cheese pizza',
            'pepperoni pizza'
        )
    )
GROUP BY
    person.name
HAVING
    COUNT(menu.pizza_name) = 2
ORDER BY 1;
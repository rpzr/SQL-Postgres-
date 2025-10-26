SELECT name, SUM(count) as total_count
FROM (
        (
            SELECT pizzeria.name, COUNT(person_visits.person_id), 'visit' AS action_type
            FROM pizzeria
                JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
            GROUP BY
                pizzeria.name
            ORDER BY count DESC
            LIMIT 3
        )
        UNION
        (
            SELECT pizzeria.name, COUNT(person_order.person_id), 'order' AS action_type
            FROM
                pizzeria
                JOIN menu ON menu.pizzeria_id = pizzeria.id
                JOIN person_order ON person_order.menu_id = menu.id
            GROUP BY
                pizzeria.name
            ORDER BY count DESC
            LIMIT 3
        )
    ) AS sum_table
GROUP BY
    name
ORDER BY 2 DESC, 1;
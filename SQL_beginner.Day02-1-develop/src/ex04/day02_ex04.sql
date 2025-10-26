SELECT
    pizza_name,
    piz.name AS pizzeria_name,
    price
FROM menu m
    JOIN pizzeria piz ON piz.id = m.pizzeria_id
WHERE
    pizza_name = 'mushroom pizza'
    OR pizza_name = 'pepperoni pizza'
ORDER BY 1, 2;
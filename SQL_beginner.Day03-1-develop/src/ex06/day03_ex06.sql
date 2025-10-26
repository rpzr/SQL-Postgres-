SELECT DISTINCT
    menu_1.pizza_name,
    piz_1.name AS pizzeria_name_1,
    piz_2.name AS pizzeria_name_2,
    menu_1.price
FROM
    menu menu_1
    JOIN menu menu_2 ON menu_1.price = menu_2.price
    JOIN pizzeria piz_1 ON menu_1.pizzeria_id = piz_1.id
    JOIN pizzeria piz_2 ON menu_2.pizzeria_id = piz_2.id
WHERE
    menu_1.id > menu_2.id
    AND piz_1.name <> piz_2.name
ORDER BY 1;
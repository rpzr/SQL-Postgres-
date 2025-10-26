INSERT INTO
    person_discounts
SELECT
    ROW_NUMBER() OVER () AS id,
    person_order.person_id,
    pizzeria_id,
    CASE
        WHEN COUNT(person_order.menu_id) = 1 THEN 10.5
        WHEN COUNT(person_order.menu_id) = 2 THEN 22.0
        ELSE 30.0
    END AS discount
FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
GROUP BY
    person_order.person_id,
    menu.pizzeria_id
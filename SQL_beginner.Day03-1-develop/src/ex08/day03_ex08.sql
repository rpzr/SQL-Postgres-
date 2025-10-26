INSERT INTO
    menu
VALUES (
        (
            SELECT MAX(id) + 1
            FROM menu
        ),
        (
            SELECT DISTINCT
                pizzeria_id
            FROM menu
                JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
            WHERE
                pizzeria.name LIKE 'Domin%'
        ),
        'sicilian pizza',
        900
    );
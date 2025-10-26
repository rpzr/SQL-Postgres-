INSERT INTO
    person_order
VALUES (
        (
            SELECT MAX(id) + 1
            FROM person_order
        ),
        (
            SELECT id
            FROM person
            WHERE
                person.name = 'Denis'
        ),
        (
            SELECT id
            FROM menu
            WHERE
                menu.pizza_name = 'sicilian pizza'
        ),
        '2022-02-24'
    )

INSERT INTO
    person_order
VALUES (
        (
            SELECT MAX(id) + 1
            FROM person_order
        ),
        (
            SELECT id
            FROM person
            WHERE
                person.name = 'Irina'
        ),
        (
            SELECT id
            FROM menu
            WHERE
                menu.pizza_name = 'sicilian pizza'
        ),
        '2022-02-24'
    )
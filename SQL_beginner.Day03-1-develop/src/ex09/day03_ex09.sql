INSERT INTO
    person_visits
VALUES (
        (
            SELECT MAX(id) + 1
            FROM person_visits
        ),
        (
            SELECT id
            FROM person
            WHERE
                person.name = 'Denis'
        ),
        (
            SELECT id
            FROM pizzeria
            WHERE
                pizzeria.name = 'Dominos'
        ),
        '2022-02-24'
    );

INSERT INTO
    person_visits
VALUES (
        (
            SELECT MAX(id) + 1
            FROM person_visits
        ),
        (
            SELECT id
            FROM person
            WHERE
                person.name = 'Irina'
        ),
        (
            SELECT id
            FROM pizzeria
            WHERE
                pizzeria.name = 'Dominos'
        ),
        '2022-02-24'
    );
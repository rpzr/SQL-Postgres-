WITH
    gender_order AS (
        SELECT
            pizzeria.name,
            SUM(
                CASE
                    WHEN gender = 'female' THEN 1
                    ELSE 0
                END
            ) AS female_visits,
            SUM(
                CASE
                    WHEN gender = 'male' THEN 1
                    ELSE 0
                END
            ) AS male_visits
        FROM
            person_order
            JOIN person ON person_order.person_id = person.id
            JOIN menu ON person_order.menu_id = menu.id
            JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
        GROUP BY
            pizzeria.name
    )
SELECT gender_order.name AS pizzeria_name
FROM gender_order
WHERE
    gender_order.female_visits = 0
UNION
SELECT gender_order.name AS pizzeria_name
FROM gender_order
WHERE
    gender_order.male_visits = 0;
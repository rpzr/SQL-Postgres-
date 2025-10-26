WITH
    gender_visits AS (
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
            person_visits
            JOIN person ON person_visits.person_id = person.id
            JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
        GROUP BY
            pizzeria.name
    )
SELECT gender_visits.name
FROM gender_visits
WHERE
    gender_visits.female_visits > gender_visits.male_visits
UNION ALL
SELECT gender_visits.name
FROM gender_visits
WHERE
    gender_visits.male_visits > gender_visits.female_visits
ORDER BY 1;
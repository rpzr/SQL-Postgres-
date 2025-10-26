SELECT gs.date as missing_date
FROM generate_series(
        '2022-01-01', '2022-01-10', interval '1 day'
    ) AS gs
    LEFT JOIN (
        SELECT DISTINCT
            visit_date
        FROM person_visits
        WHERE
            person_id = 1
            OR person_id = 2
    ) AS pv_ids ON gs.date = pv_ids.visit_date
WHERE
    pv_ids.visit_date IS NULL
ORDER BY gs.date
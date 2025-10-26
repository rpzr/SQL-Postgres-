WITH
    series AS (
        SELECT DISTINCT
            visit_date AS missing_date
        FROM person_visits
    )
SELECT missing_date
FROM
    series s
    LEFT JOIN (
        SELECT DISTINCT
            visit_date
        FROM person_visits
        WHERE
            person_id = 1
            OR person_id = 2
    ) AS pv_ids ON missing_date = pv_ids.visit_date
WHERE
    pv_ids.visit_date IS NULL
ORDER BY 1
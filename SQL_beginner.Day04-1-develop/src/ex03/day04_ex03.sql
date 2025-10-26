SELECT v_generated_dates.date
FROM
    v_generated_dates
    LEFT JOIN person_visits ON v_generated_dates.date = person_visits.visit_date
WHERE
    person_visits.visit_date IS NULL
ORDER BY 1;
insert into currency values ( 100, 'EUR', 0.85, '2022-01-01 13:29' );

insert into currency values ( 100, 'EUR', 0.79, '2022-01-08 13:29' );

WITH
    cte_rates AS (
        SELECT
            "user".name,
            "user".lastname,
            balance.user_id,
            currency.name AS currency_name,
            balance.money,
            (
                SELECT currency.rate_to_usd
                FROM currency
                WHERE
                    currency.id = balance.currency_id
                    AND currency.updated < balance.updated
                ORDER BY rate_to_usd
                LIMIT 1
            ) AS min_rate_to_usd,
            (
                SELECT currency.rate_to_usd
                FROM currency
                WHERE
                    currency.id = balance.currency_id
                    AND currency.updated > balance.updated
                ORDER BY rate_to_usd
                LIMIT 1
            ) AS max_rate_to_usd
        FROM
            currency
            JOIN balance ON balance.currency_id = currency.id
            LEFT JOIN "user" ON balance.user_id = "user".id
        GROUP BY
            balance.money,
            currency.name,
            balance.updated,
            balance.currency_id,
            balance.user_id,
            "user".name,
            "user".lastname
        ORDER BY
            min_rate_to_usd DESC,
            max_rate_to_usd
    )
SELECT
    COALESCE(cte_rates.name, 'not defined') AS name,
    COALESCE(
        cte_rates.lastname,
        'not defined'
    ) AS lastname,
    cte_rates.currency_name,
    (
        cte_rates.money * (
            COALESCE(
                cte_rates.min_rate_to_usd,
                cte_rates.max_rate_to_usd
            )
        )
    )::FLOAT AS currency_in_usd
FROM cte_rates
ORDER BY 1 DESC, 2, 3;
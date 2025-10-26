WITH
    cte_rate AS (
        SELECT
            rate_to_usd AS last_rate_to_usd,
            id,
            currency.name AS currency_name
        FROM currency
        WHERE
            updated IN (
                SELECT MAX(updated)
                FROM currency
            )
    )
SELECT
    COALESCE("user".name, 'not defined'),
    COALESCE(
        "user".lastname,
        'not defined'
    ),
    balance."type",
    COALESCE(SUM(balance.money), 0) AS volume,
    COALESCE(currency_name, 'not defined'),
    COALESCE(last_rate_to_usd, 1),
    SUM(
        balance.money * COALESCE(last_rate_to_usd, 1)
    )::FLOAT AS total_volume_in_usd
FROM
    "user"
    FULL JOIN balance ON balance.user_id = "user".id
    FULL JOIN cte_rate ON balance.currency_id = cte_rate.id
GROUP BY
    "user".name,
    "user".lastname,
    balance."type",
    cte_rate.last_rate_to_usd,
    currency_name
ORDER BY 1 DESC, 2, 3;
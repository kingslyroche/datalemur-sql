/* Say you have access to all the transactions for a given merchant account. 
 Write a query to print the cumulative balance of the merchant account at the end of each day, 
 with the total balance reset back to zero at the end of the month. Output the transaction date and cumulative balance. */
WITH daily_balances AS (
    SELECT
        DATE_TRUNC('day', transaction_date) AS transaction_day,
        DATE_TRUNC('month', transaction_date) AS transaction_month,
        SUM(
            CASE
                WHEN TYPE = 'deposit' THEN amount
                WHEN TYPE = 'withdrawal' THEN - amount
            END
        ) AS balance
    FROM
        transactions
    GROUP BY
        DATE_TRUNC('day', transaction_date),
        DATE_TRUNC('month', transaction_date)
)
SELECT
    transaction_day,
    SUM(balance) OVER (
        PARTITION BY transaction_month
        ORDER BY
            transaction_day
    ) AS balance
FROM
    daily_balances
ORDER BY
    transaction_day;
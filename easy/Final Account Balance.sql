-- Given a table of bank deposits and withdrawals, return the final balance for each account.
-- Assumption:
-- All the transactions performed for each account are present in the table; no transactions are missing.
SELECT
    account_id,
    sum(
        CASE
            WHEN transaction_type = 'Deposit' THEN amount
            ELSE -1 * amount
        END
    ) AS final_balance
FROM
    transactions
GROUP BY
    account_id;
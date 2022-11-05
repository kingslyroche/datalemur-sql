-- Sometimes, payment transactions are repeated by accident; it could be due to user error, API failure or a retry error that causes a credit card to be charged twice.
-- Using the transactions table, identify any payments made at the same merchant with the same credit card for the same amount within 10 minutes of each other. Count such repeated payments.
-- Assumptions:
-- The first transaction of such payments should not be counted as a repeated payment. This means, if there are two transactions performed by a merchant with the same credit card and for the same amount within 10 minutes, there will only be 1 repeated payment.
SELECT
    count(1) AS payment_count
FROM
    (
        SELECT
            merchant_id,
            credit_card_id,
            amount,
            extract(
                epoch
                FROM
                    lead(transaction_timestamp) over(PARTITION by merchant_id, credit_card_id, amount) - transaction_timestamp
            ) / 60 AS min_diff
        FROM
            transactions
    ) a
WHERE
    min_diff <= 10;
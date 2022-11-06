/* Assume you are given the table below on user transactions. Write a query to obtain the list of customers whose first transaction was valued at $50 or more. Output the number of users.
 
 Clarification:
 
 Use the transaction_date field to determine which transaction should be labeled as the first for each user.
 Use a specific function (we can't give too much away!) to account for scenarios where a user had multiple transactions on the same day, and one of those was the first.
 
 */
SELECT
    count(1) AS users
FROM
(
        SELECT
            *,
            row_number() over(
                PARTITION BY user_id
                ORDER BY
                    transaction_date,
                    transaction_id
            ) AS rn
        FROM
            user_transactions
    ) a
WHERE
    rn = 1
    AND spend >= 50
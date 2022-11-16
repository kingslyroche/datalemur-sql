/* In an effort to identify high-value customers, Amazon asked for your help to obtain data about users who go on shopping sprees. A shopping spree occurs when a user makes purchases on 3 or more consecutive days.

List the user IDs who have gone on at least 1 shopping spree in ascending order. */


WITH cte
     AS (SELECT *
         FROM   (SELECT user_id,
                        Lead(transaction_date, 1)
                          over(
                            PARTITION BY user_id
                            ORDER BY transaction_date) :: DATE AS next_date,
                        transaction_date :: DATE,
                        Lag(transaction_date, 1)
                          over(
                            PARTITION BY user_id
                            ORDER BY transaction_date) :: DATE AS prev_date
                 FROM   transactions) a
         WHERE  next_date IS NOT NULL
                AND prev_date IS NOT NULL)
SELECT DISTINCT user_id
FROM   cte
WHERE  transaction_date - prev_date = 1
       AND next_date - transaction_date = 1 
/* 
 Write a query to obtain the number of users 
 who purchased the same product on two or more different days. Output the number of unique users. */
WITH repeat_purchases AS (
    SELECT
        DISTINCT user_id AS users
    FROM
        purchases
    GROUP BY
        user_id,
        product_id
    HAVING
        COUNT(DISTINCT purchase_date :: DATE) > 1
)
SELECT
    COUNT(DISTINCT users) AS repeated_purchasers
FROM
    repeat_purchases;
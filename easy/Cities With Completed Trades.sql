-- You are given the tables below containing information on Robinhood trades and users. Write a query to list the top three cities that have the most completed trade orders in descending order.
-- Output the city and number of orders.
SELECT
    city,
    count(1) AS total_orders
FROM
    trades
    INNER JOIN users ON trades.user_id = users.user_id
WHERE
    trades.status = 'Completed'
GROUP BY
    city
ORDER BY
    total_orders DESC
LIMIT
    3;
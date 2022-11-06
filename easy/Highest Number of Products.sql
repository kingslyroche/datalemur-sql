/* Assume that you are given the table below containing information on various orders made by eBay customers. Write a query to obtain the user IDs and number of products purchased by the top 3 customers; these customers must have spent at least $1,000 in total.
 
 Output the user id and number of products in descending order. To break ties (i.e., if 2 customers both bought 10 products), the user who spent more should take precedence. */
SELECT
    user_id,
    count(1) AS product_num
FROM
    user_transactions
GROUP BY
    user_id
HAVING
    sum(spend) > 1000
ORDER BY
    product_num DESC,
    sum(spend) DESC
LIMIT
    3;
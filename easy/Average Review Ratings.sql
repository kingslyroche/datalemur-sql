/* 
 
 Given the reviews table, write a query to get the average stars for each product every month.
 
 The output should include the month in numerical value, product id, and average star rating rounded to two decimal places. Sort the output based on month followed by the product id. */
SELECT
    extract(
        MONTH
        FROM
            submit_date
    ) AS mth,
    product_id,
    round(avg(stars), 2) AS avg_stars
FROM
    reviews
GROUP BY
    extract(
        MONTH
        FROM
            submit_date
    ),
    product_id
ORDER BY
    mth,
    product_id;
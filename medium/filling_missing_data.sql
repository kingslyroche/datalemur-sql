-- When you log in to your retailer client's database, you notice that their product catalog data is full of gaps in the category column. Can you write a SQL query that returns the product catalog with the missing data filled in?

-- Assumptions

-- Each category is mentioned only once in a category column.
-- All the products belonging to same category are grouped together.
-- The first product from a product group will always have a defined category.
-- Meaning that the first item from each category will not have a missing category value.



WITH cte1 AS (
    SELECT
        product_id,
        category,
        name,
        row_number() over(
            ORDER BY
                product_id
        ) AS rn
    FROM
        products
),
cte2 AS (
    SELECT
        *,
        lead(rn, 1, 9999) over (
            ORDER BY
                product_id
        ) AS next_rn
    FROM
        cte1
    WHERE
        category IS NOT NULL
)
SELECT
    cte1.product_id,
    cte2.category,
    cte1.name
FROM
    cte1
    INNER JOIN cte2 ON cte1.rn >= cte2.rn
    AND cte1.rn <= cte2.next_rn -1
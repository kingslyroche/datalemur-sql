-- Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. Write a query to get the number of companies that have posted duplicate job listings.
-- Clarification:
-- Duplicate job listings refer to two jobs at the same company with the same title and description.
SELECT
    count(DISTINCT company_id) AS duplicate_companies
FROM
    (
        SELECT
            company_id,
            title,
            description
        FROM
            job_listings
        GROUP BY
            company_id,
            title,
            description
        HAVING
            count(1) > 1
    ) a;
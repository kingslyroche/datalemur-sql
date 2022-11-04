-- Your team at Accenture is helping a Fortune 500 client revamp their compensation and benefits program. The first step in this analysis is to manually review employees who are potentially overpaid or underpaid.

-- An employee is considered to be potentially overpaid if they earn more than 2 times the average salary for people with the same title. Similarly, an employee might be underpaid if they earn less than half of the average for their title. We'll refer to employees who are both underpaid and overpaid as compensation outliers for the purposes of this problem.

-- Write a query that shows the following data for each compensation outlier: employee ID, salary, and whether they are potentially overpaid or potentially underpaid (refer to Example Output below).



SELECT
    *
FROM
(
        SELECT
            employee_id,
            salary,
            CASE
                WHEN salary > AVG(SALARY) over(PARTITION BY title) * 2 THEN 'Overpaid'
                WHEN salary < AVG(SALARY) over(PARTITION BY title) / 2 THEN 'Underpaid'
            END AS outlier_status
        FROM
            employee_pay
    ) a
WHERE
    outlier_status IS NOT NULL;
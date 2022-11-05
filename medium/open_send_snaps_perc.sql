-- Assume you are given the tables below containing information on Snapchat users, their ages, 
-- and their time spent sending and opening snaps. Write a query to obtain a 
-- breakdown of the time spent sending vs. opening snaps (as a percentage of total time spent on these activities) for each age group.

-- Output the age bucket and percentage of sending and opening snaps. Round the percentage to 2 decimal places.

-- Notes:

-- You should calculate these percentages:
-- time sending / (time sending + time opening)
-- time opening / (time sending + time opening)
-- To avoid integer division in percentages, multiply by 100.0 and not 100.


WITH cte AS (
    SELECT
        sum(
            CASE
                WHEN activity_type = 'open' THEN time_spent
            END
        ) AS time_spent_open,
        sum(
            CASE
                WHEN activity_type = 'send' THEN time_spent
            END
        ) AS time_spent_send,
        sum(time_spent) AS total_time,
        age_brk.age_bucket
    FROM
        activities act
        INNER JOIN age_breakdown age_brk ON act.user_id = age_brk.user_id
    WHERE
        act.activity_type IN ('open', 'send')
    GROUP BY
        age_brk.age_bucket
)
SELECT
    age_bucket,
    round(100.0 * time_spent_open / total_time, 2) AS open_perc,
    round(100.0 * time_spent_send / total_time, 2) AS send_perc
FROM
    cte
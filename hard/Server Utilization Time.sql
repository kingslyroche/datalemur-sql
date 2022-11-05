-- Amazon Web Services (AWS) is powered by fleets of servers. Senior management has requested data-driven solutions to optimize server usage.
-- Write a query that calculates the total time that the fleet of servers was running. The output should be in units of full days.
-- Assumptions:
-- Each server might start and stop several times.
-- The total time in which the server fleet is running can be calculated as the sum of each server's uptime.
SELECT
    extract(
        days
        FROM
            justify_hours(sum(stop_time - start_time))
    ) AS total_uptime_days
FROM
    (
        SELECT
            server_id,
            session_status,
            status_time AS start_time,
            lead(status_time) over (
                PARTITION by server_id
                ORDER BY
                    status_time
            ) AS stop_time
        FROM
            server_utilization
    ) a
WHERE
    session_status = 'start'
    AND stop_time IS NOT NULL;
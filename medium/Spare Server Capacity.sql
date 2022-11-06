/* Microsoft Azure's capacity planning team wants to understand 
 how much data its customers are using, and how much spare capacity is left in each of it's data centers. 
 You’re given three tables: customers, datacenters, and forecasted_demand.
 
 Write a query to find the total monthly unused server capacity for each data center.
 Output the data center id in ascending order and the total spare capacity. */
SELECT
    datacenter_id,
    sum(capacity) AS spare_capacity
FROM
(
        SELECT
            datacenter_id,
            -1 * monthly_demand AS capacity
        FROM
            forecasted_demand
        UNION
        ALL
        SELECT
            datacenter_id,
            monthly_capacity AS capacity
        FROM
            datacenters
    ) a
GROUP BY
    datacenter_id
/* HAVING
    sum(capacity) > 0 */
ORDER BY
    datacenter_id;
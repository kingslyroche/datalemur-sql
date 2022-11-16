/* WRITE a query TO find the top 2 power users who sent the most messages ON Microsoft Teams IN August 2022.Display the IDs of these 2 users along WITH the total number of messages they sent.Output the results IN descending count of the messages. */
SELECT
    sender_id,
    count(message_id) AS message_count
FROM
    messages
WHERE
    extract(
        MONTH
        FROM
            sent_date
    ) = 8
    AND extract(
        year
        FROM
            sent_date
    ) = 2022
GROUP BY
    sender_id
ORDER BY
    message_count DESC
LIMIT
    2;
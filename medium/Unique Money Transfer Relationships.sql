/* You are given a table of PayPal payments showing the payer, the recipient, and the amount paid. 
 A two-way unique relationship is established when two people send money back and forth. 
 Write a query to find the number of two-way unique relationships in this data.
 
 Assumption:
 
 A payer can send money to the same recipient multiple times. */
SELECT
    count(1) / 2 AS unique_relationships
FROM
    (
        SELECT
            DISTINCT p1.payer_id,
            p1.recipient_id,
            p2.payer_id,
            p2.recipient_id
        FROM
            payments p1
            INNER JOIN payments p2 ON p1.recipient_id = p2.payer_id
            AND p1.payer_id = p2.recipient_id
    ) a;
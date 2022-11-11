/* Visa is analysing its partnership with ApplyPay. Calculate the total transaction volume for each merchant where the transaction was performed via ApplePay.
 
 Output the merchant ID and the total transactions. For merchants with no ApplePay transactions, output their total transaction volume as 0. Display the result in descending order of the transaction volume.
 
 Tip: You might want to check the spelling of the payment methods... just sayin' 👀 */
SELECT
    merchant_id,
    sum(
        CASE
            WHEN lower(payment_method) = 'apple pay' THEN transaction_amount
            ELSE 0
        END
    ) AS total_transaction
FROM
    transactions
GROUP BY
    merchant_id
ORDER BY
    total_transaction DESC;
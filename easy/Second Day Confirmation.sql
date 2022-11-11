/* New TikTok users sign up with their emails and each user receives a text confirmation to activate their account. Assume you are given the below tables about emails and texts.
 
 Write a query to display the ids of the users who did not confirm on the first day of sign-up, but confirmed on the second day.
 
 Assumption:
 
 action_date is the date when the user activated their account and confirmed their sign-up through the text. */
SELECT
    DISTINCT user_id
FROM
    emails
    JOIN texts ON emails.email_id = texts.email_id
WHERE
    signup_action = 'Confirmed'
    AND action_date = signup_date + INTERVAL '1 day';
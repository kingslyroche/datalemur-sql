-- Assume you are given the table below containing tweet data. 
-- Write a query to obtain a histogram of tweets posted per user in 2022. 
-- Output the tweet count per user as the bucket, and then the number of Twitter users who fall into that bucket.
SELECT
    tweets_num AS bucket,
    count(user_id) AS users_num
FROM
    (
        SELECT
            user_id,
            COUNT(tweet_id) AS tweets_num
        FROM
            tweets
        WHERE
            EXTRACT(
                year
                FROM
                    tweet_date
            ) = 2022
        GROUP BY
            user_id
    ) a
GROUP BY
    tweets_num;
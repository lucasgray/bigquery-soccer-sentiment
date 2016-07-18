SELECT 
  substr(TIME(created_utc), 0, 4) + '0' as time, --ten minute intervals
  avg(sentiment) as the_average,  
  sum(sentiment) as the_sum,  
  count(1) as the_count
  

FROM applySentiment(
  SELECT 
    body, 
    author_flair_text, 
    created_utc 
  FROM [pushshift:rt_reddit.comments]

  where 
  subreddit = 'soccer'
  and link_id in ('4qt3kh','4qtyhm') --match and post-match threads
  and created_utc >= TIMESTAMP("2016-07-01 17:00:00")
  and created_utc <= TIMESTAMP("2016-07-02 00:00:00")
  and author_flair_text='Wales' --flair to determine team's fans
)
group by time
order by time asc

SELECT 
  avg(sentiment) as the_average,  
  sum(sentiment) as the_sum,  
  count(1) as the_count,
  author_flair_text

FROM applySentiment(
  SELECT 
    body, 
    author_flair_text, 
    created_utc 
  FROM [pushshift:rt_reddit.comments]

  where 
  subreddit = 'soccer'

  and created_utc >= TIMESTAMP("2016-06-30 00:00:00")
  and created_utc <= TIMESTAMP("2016-07-11 00:00:00")
  and author_flair_text in (
    'Poland',
    'Portugal',
    'Wales',
    'Belgium',
    'Germany',
    'Italy',
    'France',
    'Iceland'
    
  )
)
group by author_flair_text
order by the_average desc

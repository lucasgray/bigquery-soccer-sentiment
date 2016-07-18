### Bigquery reddit sentiment analysis

We wrote a blog post on fan activity during the 2016 Eurocup, [Joy & Agony: Fan Loyalty & Perception of Euro 2016](http://beekeeperdata.com/posts/bigquery/2016/07/11/fan-loyalty-euro-2016.html).  Our goal was to find how well sentiment during the game correlates to the activity within the game, as well as determine who's fans are the overall chattiest, most positive, etc.

We used sentiment.js as our sentiment scoring engine, tweaked to run on bigquery instead of node, and smushed our UDF registration into the same file for ease of use.  That file is in the udf directory, and one sample trendline query and one sample overall query are in the sql directory.

Enjoy!

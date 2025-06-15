# Dataframe Documentation

Generated on: 2025-06-12 10:29:06 

## addconsecutivenumbers1

- Number of rows: 478278
- Number of columns: 16
- Size: 1768.84 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| entities | data.frame | 0 |
| lang | character | 0 |
| text | character | 0 |
| created_at | character | 0 |
| conversation_id | character | 0 |
| possibly_sensitive | logical | 0 |
| public_metrics | data.frame | 0 |
| source | character | 0 |
| author_id | character | 0 |
| referenced_tweets | list | 0 |
| attachments | data.frame | 0 |
| geo | data.frame | 955103 |
| withheld | data.frame | 953908 |
| in_reply_to_user_id | character | 470434 |
| observation | integer | 0 |


## addconsecutivenumbers2

- Number of rows: 478278
- Number of columns: 32
- Size: 334.62 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| tweet_id | character | 0 |
| user_username | character | 0 |
| text | character | 0 |
| lang | character | 0 |
| created_at | character | 0 |
| conversation_id | character | 0 |
| possibly_sensitive | logical | 0 |
| source | character | 0 |
| author_id | character | 0 |
| user_location | character | 258591 |
| user_description | character | 0 |
| user_name | character | 0 |
| user_protected | logical | 0 |
| user_created_at | character | 0 |
| user_profile_image_url | character | 0 |
| user_verified | logical | 0 |
| user_pinned_tweet_id | character | 258374 |
| user_url | character | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| sourcetweet_type | character | 58016 |
| sourcetweet_id | character | 58016 |
| sourcetweet_text | character | 58016 |
| sourcetweet_lang | character | 58016 |
| sourcetweet_author_id | character | 58016 |
| in_reply_to_user_id | character | 470434 |
| observation | integer | 0 |


## addconsecutivenumbers3

- Number of rows: 478278
- Number of columns: 5
- Size: 200.39 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| hashtag | list | 314707 |
| url | list | 386150 |
| mention_username | list | 74885 |
| mention_id | list | 74885 |
| observation | integer | 0 |


## bi.gram.count

- Number of rows: 327778
- Number of columns: 3
- Size: 17.78 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| word1 | character | 0 |
| word2 | character | 0 |
| weight | integer | 0 |


## bi.gram.words

- Number of rows: 822443
- Number of columns: 10
- Size: 226.85 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | POSIXct | 0 |
| text | character | 0 |
| hashtag | list | 340403 |
| created_at_round | POSIXct | 0 |
| text2 | character | 0 |
| clean.text | character | 0 |
| hashtag.clean | character | 0 |
| word1 | character | 0 |
| word2 | character | 0 |


## bigram.data

- Number of rows: 822443
- Number of columns: 2
- Size: 22.83 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| word1 | character | 0 |
| word2 | character | 0 |


## df

- Number of rows: 822443
- Number of columns: 2
- Size: 22.83 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| word1 | character | 0 |
| word2 | character | 0 |


## df.extracted

- Number of rows: 478278
- Number of columns: 4
- Size: 198.56 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| hashtag | list | 314707 |
| url | list | 386150 |
| mention_username | list | 74885 |
| mention_id | list | 74885 |


## hashtag.count

- Number of rows: 5123
- Number of columns: 2
- Size: 0.40 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| hashtag | character | 0 |
| n | integer | 0 |


## hashtags.unnested.df

- Number of rows: 65908
- Number of columns: 2
- Size: 1.58 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| created_at_round | POSIXct | 0 |
| hashtag | character | 0 |


## idgeline.plot.data

- Number of rows: 478246
- Number of columns: 31
- Size: 433.76 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | POSIXct | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| url | list | 386123 |
| hashtag | list | 314683 |
| mention_username | list | 74878 |
| mention_id | list | 74878 |
| sourcetweet_type | character | 0 |
| sourcetweet_id | character | 58016 |
| sourcetweet_text | character | 58016 |
| sourcetweet_author_id | character | 58016 |
| text | character | 0 |
| possibly_sensitive | logical | 0 |
| author_id | character | 0 |
| user_username | character | 0 |
| user_name | character | 0 |
| user_description | character | 0 |
| user_profile_image_url | character | 0 |
| user_url | character | 0 |
| user_verified | logical | 0 |
| user_location | character | 258570 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| source | character | 0 |
| in_reply_to_user_id | character | 470402 |
| screen_name | character | 51054 |
| created_at_round | POSIXct | 0 |


## in_reply_to_usernames

- Number of rows: 3662
- Number of columns: 90
- Size: 11.07 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_id | character | 0 |
| status_id | character | 175 |
| created_at | POSIXct | 175 |
| screen_name | character | 0 |
| text | character | 175 |
| source | character | 175 |
| display_text_width | integer | 3662 |
| reply_to_status_id | character | 2554 |
| reply_to_user_id | character | 2538 |
| reply_to_screen_name | character | 2538 |
| is_quote | logical | 0 |
| is_retweet | logical | 0 |
| favorite_count | integer | 175 |
| retweet_count | integer | 175 |
| quote_count | integer | 3662 |
| reply_count | integer | 3662 |
| hashtags | list | 3266 |
| symbols | list | 3658 |
| urls_url | list | 2616 |
| urls_t.co | list | 2616 |
| urls_expanded_url | list | 2616 |
| media_url | list | 3075 |
| media_t.co | list | 3075 |
| media_expanded_url | list | 3075 |
| media_type | list | 3075 |
| ext_media_url | list | 3075 |
| ext_media_t.co | list | 3075 |
| ext_media_expanded_url | list | 3075 |
| ext_media_type | character | 3662 |
| mentions_user_id | list | 1596 |
| mentions_screen_name | list | 1596 |
| lang | character | 175 |
| quoted_status_id | character | 3662 |
| quoted_text | character | 3662 |
| quoted_created_at | POSIXct | 3662 |
| quoted_source | character | 3662 |
| quoted_favorite_count | integer | 3662 |
| quoted_retweet_count | integer | 3662 |
| quoted_user_id | character | 3662 |
| quoted_screen_name | character | 3662 |
| quoted_name | character | 3662 |
| quoted_followers_count | integer | 3662 |
| quoted_friends_count | integer | 3662 |
| quoted_statuses_count | integer | 3662 |
| quoted_location | character | 3662 |
| quoted_description | character | 3662 |
| quoted_verified | logical | 3662 |
| retweet_status_id | character | 2675 |
| retweet_text | character | 2675 |
| retweet_created_at | POSIXct | 2675 |
| retweet_source | character | 2675 |
| retweet_favorite_count | integer | 2675 |
| retweet_retweet_count | integer | 2675 |
| retweet_user_id | character | 3662 |
| retweet_screen_name | character | 3662 |
| retweet_name | character | 3662 |
| retweet_followers_count | integer | 3662 |
| retweet_friends_count | integer | 3662 |
| retweet_statuses_count | integer | 3662 |
| retweet_location | character | 3662 |
| retweet_description | character | 3662 |
| retweet_verified | logical | 3662 |
| place_url | character | 3601 |
| place_name | character | 3601 |
| place_full_name | character | 3601 |
| place_type | character | 3601 |
| country | character | 3601 |
| country_code | character | 3601 |
| geo_coords | list | 0 |
| coords_coords | list | 0 |
| bbox_coords | list | 0 |
| status_url | character | 175 |
| name | character | 0 |
| location | character | 0 |
| description | character | 0 |
| url | character | 2466 |
| protected | logical | 0 |
| followers_count | integer | 0 |
| friends_count | integer | 0 |
| listed_count | integer | 0 |
| statuses_count | integer | 0 |
| favourites_count | integer | 0 |
| account_created_at | POSIXct | 0 |
| verified | logical | 0 |
| profile_url | character | 2466 |
| profile_expanded_url | character | 2468 |
| account_lang | logical | 3662 |
| profile_banner_url | character | 300 |
| profile_background_url | character | 1856 |
| profile_image_url | character | 0 |


## joined

- Number of rows: 478278
- Number of columns: 51
- Size: 2300.21 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| observation | integer | 0 |
| id | character | 0 |
| entities | data.frame | 0 |
| lang.x | character | 0 |
| text.x | character | 0 |
| created_at.x | character | 0 |
| conversation_id.x | character | 0 |
| possibly_sensitive.x | logical | 0 |
| public_metrics | data.frame | 0 |
| source.x | character | 0 |
| author_id.x | character | 0 |
| referenced_tweets | list | 0 |
| attachments | data.frame | 0 |
| geo | data.frame | 955103 |
| withheld | data.frame | 953908 |
| in_reply_to_user_id.x | character | 470434 |
| tweet_id | character | 0 |
| user_username | character | 0 |
| text.y | character | 0 |
| lang.y | character | 0 |
| created_at.y | character | 0 |
| conversation_id.y | character | 0 |
| possibly_sensitive.y | logical | 0 |
| source.y | character | 0 |
| author_id.y | character | 0 |
| user_location | character | 258591 |
| user_description | character | 0 |
| user_name | character | 0 |
| user_protected | logical | 0 |
| user_created_at | character | 0 |
| user_profile_image_url | character | 0 |
| user_verified | logical | 0 |
| user_pinned_tweet_id | character | 258374 |
| user_url | character | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| sourcetweet_type | character | 58016 |
| sourcetweet_id | character | 58016 |
| sourcetweet_text | character | 58016 |
| sourcetweet_lang | character | 58016 |
| sourcetweet_author_id | character | 58016 |
| in_reply_to_user_id.y | character | 470434 |
| hashtag | list | 314707 |
| url | list | 386150 |
| mention_username | list | 74885 |
| mention_id | list | 74885 |


## joined_entities

- Number of rows: 478278
- Number of columns: 3
- Size: 991.41 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| urls | list | 0 |
| mentions | list | 0 |
| hashtags | list | 0 |


## joined_entities.hashtag

- Number of rows: 478278
- Number of columns: 2
- Size: 260.98 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| hashtag | list | 0 |
| hashtags | list | 0 |


## joined_entities.mention_ids

- Number of rows: 478278
- Number of columns: 2
- Size: 563.33 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| mention_id | list | 0 |
| mentions | list | 0 |


## joined_entities.mentions

- Number of rows: 478278
- Number of columns: 2
- Size: 559.91 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| mention_username | list | 0 |
| mentions | list | 0 |


## joined_entities.url

- Number of rows: 478278
- Number of columns: 2
- Size: 258.30 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| url | list | 0 |
| urls | list | 0 |


## joined.clean

- Number of rows: 478278
- Number of columns: 29
- Size: 452.97 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | character | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| url | list | 386150 |
| hashtag | list | 314707 |
| mention_username | list | 74885 |
| mention_id | list | 74885 |
| sourcetweet_type | character | 58016 |
| sourcetweet_id | character | 58016 |
| sourcetweet_text | character | 58016 |
| sourcetweet_author_id | character | 58016 |
| text | character | 0 |
| possibly_sensitive | logical | 0 |
| author_id | character | 0 |
| user_username | character | 0 |
| user_name | character | 0 |
| user_description | character | 0 |
| user_profile_image_url | character | 0 |
| user_url | character | 0 |
| user_verified | logical | 0 |
| user_location | character | 258591 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| source | character | 0 |
| in_reply_to_user_id | character | 470434 |


## melt_df_pinargultekin

- Number of rows: 15804
- Number of columns: 3
- Size: 0.24 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| time | POSIXct | 0 |
| variable | factor | 0 |
| value | integer | 0 |


## membership.df

- Number of rows: 381
- Number of columns: 2
- Size: 0.03 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| word | character | 0 |
| cluster | numeric | 0 |


## mentions

- Number of rows: 65631
- Number of columns: 31
- Size: 80.84 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | POSIXct | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| url | list | 21567 |
| hashtag | list | 26364 |
| mention_username | list | 54431 |
| mention_id | list | 54431 |
| sourcetweet_type | character | 0 |
| sourcetweet_id | character | 58016 |
| sourcetweet_text | character | 58016 |
| sourcetweet_author_id | character | 58016 |
| text | character | 0 |
| possibly_sensitive | logical | 0 |
| author_id | character | 0 |
| user_username | character | 0 |
| user_name | character | 0 |
| user_description | character | 0 |
| user_profile_image_url | character | 0 |
| user_url | character | 0 |
| user_verified | logical | 0 |
| user_location | character | 27850 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| source | character | 0 |
| in_reply_to_user_id | character | 57787 |
| screen_name | character | 51054 |
| created_at_round | POSIXct | 0 |


## mentions_df

- Number of rows: 16619
- Number of columns: 5
- Size: 1.56 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_username | character | 0 |
| screen_name | character | 0 |
| device | character | 0 |
| relationship_type | character | 0 |
| created_at_round | POSIXct | 0 |


## node.impo.df

- Number of rows: 381
- Number of columns: 4
- Size: 0.11 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| word | character | 0 |
| degree | numeric | 0 |
| closeness | numeric | 0 |
| betweenness | numeric | 0 |


## pinargultekin

- Number of rows: 15804
- Number of columns: 2
- Size: 0.18 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| tarih | POSIXct | 0 |
| tweet_sayisi | integer | 0 |


## quoted

- Number of rows: 7615
- Number of columns: 31
- Size: 12.35 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | POSIXct | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| url | list | 0 |
| hashtag | list | 1258 |
| mention_username | list | 5951 |
| mention_id | list | 5951 |
| sourcetweet_type | character | 0 |
| sourcetweet_id | character | 0 |
| sourcetweet_text | character | 0 |
| sourcetweet_author_id | character | 0 |
| text | character | 0 |
| possibly_sensitive | logical | 0 |
| author_id | character | 0 |
| user_username | character | 0 |
| user_name | character | 0 |
| user_description | character | 0 |
| user_profile_image_url | character | 0 |
| user_url | character | 0 |
| user_verified | logical | 0 |
| user_location | character | 3642 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| source | character | 0 |
| in_reply_to_user_id | character | 7526 |
| screen_name | character | 0 |
| created_at_round | POSIXct | 0 |


## quoted_df

- Number of rows: 7615
- Number of columns: 5
- Size: 0.80 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_username | character | 0 |
| screen_name | character | 0 |
| device | character | 0 |
| relationship_type | character | 0 |
| created_at_round | POSIXct | 0 |


## quoted_edges

- Number of rows: 7615
- Number of columns: 2
- Size: 0.62 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| from | character | 0 |
| to | character | 0 |


## quoted_nodes

- Number of rows: 7301
- Number of columns: 2
- Size: 1.02 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| name | character | 0 |
| id | integer | 0 |


## quoted_nodes_scores

- Number of rows: 7301
- Number of columns: 5
- Size: 2.68 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| name | character | 0 |
| id | integer | 0 |
| out_degree | numeric | 0 |
| in_degree | numeric | 0 |
| betweenness | numeric | 0 |


## remove_duplicates_quoted

- Number of rows: 2651
- Number of columns: 29
- Size: 5.50 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | character | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| url | list | 0 |
| hashtag | list | 435 |
| mention_username | list | 1592 |
| mention_id | list | 1592 |
| sourcetweet_type | character | 0 |
| sourcetweet_id | character | 0 |
| sourcetweet_text | character | 0 |
| sourcetweet_author_id | character | 0 |
| text | character | 0 |
| possibly_sensitive | logical | 0 |
| author_id | character | 0 |
| user_username | character | 0 |
| user_name | character | 0 |
| user_description | character | 0 |
| user_profile_image_url | character | 0 |
| user_url | character | 0 |
| user_verified | logical | 0 |
| user_location | character | 1185 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| source | character | 0 |
| in_reply_to_user_id | character | 2631 |


## remove_duplicates_retweeted

- Number of rows: 9784
- Number of columns: 29
- Size: 17.09 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | character | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| url | list | 8683 |
| hashtag | list | 5374 |
| mention_username | list | 1129 |
| mention_id | list | 1129 |
| sourcetweet_type | character | 0 |
| sourcetweet_id | character | 0 |
| sourcetweet_text | character | 0 |
| sourcetweet_author_id | character | 0 |
| text | character | 0 |
| possibly_sensitive | logical | 0 |
| author_id | character | 0 |
| user_username | character | 0 |
| user_name | character | 0 |
| user_description | character | 0 |
| user_profile_image_url | character | 0 |
| user_url | character | 0 |
| user_verified | logical | 0 |
| user_location | character | 5084 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| source | character | 0 |
| in_reply_to_user_id | character | 9784 |


## remove_duplicates_uniques

- Number of rows: 4326
- Number of columns: 29
- Size: 8.30 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | character | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| url | list | 3601 |
| hashtag | list | 2084 |
| mention_username | list | 1395 |
| mention_id | list | 1395 |
| sourcetweet_type | character | 4326 |
| sourcetweet_id | character | 4326 |
| sourcetweet_text | character | 4326 |
| sourcetweet_author_id | character | 4326 |
| text | character | 0 |
| possibly_sensitive | logical | 0 |
| author_id | character | 0 |
| user_username | character | 0 |
| user_name | character | 0 |
| user_description | character | 0 |
| user_profile_image_url | character | 0 |
| user_url | character | 0 |
| user_verified | logical | 0 |
| user_location | character | 2049 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| source | character | 0 |
| in_reply_to_user_id | character | 1 |


## replyto_df

- Number of rows: 6962
- Number of columns: 5
- Size: 0.75 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_username | character | 0 |
| screen_name | character | 0 |
| device | character | 0 |
| relationship_type | character | 0 |
| created_at_round | POSIXct | 0 |


## retweet_df

- Number of rows: 412615
- Number of columns: 5
- Size: 27.00 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_username | character | 0 |
| screen_name | character | 0 |
| device | character | 0 |
| relationship_type | character | 0 |
| created_at_round | POSIXct | 0 |


## retweet_edges

- Number of rows: 412615
- Number of columns: 2
- Size: 17.55 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| from | character | 0 |
| to | character | 0 |


## retweet_nodes

- Number of rows: 182668
- Number of columns: 2
- Size: 25.52 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| name | character | 0 |
| id | integer | 0 |


## retweet_nodes_scores

- Number of rows: 182668
- Number of columns: 5
- Size: 66.93 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| name | character | 0 |
| id | integer | 0 |
| out_degree | numeric | 0 |
| in_degree | numeric | 0 |
| betweenness | numeric | 0 |


## retweeted

- Number of rows: 412615
- Number of columns: 31
- Size: 358.77 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | POSIXct | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| url | list | 364556 |
| hashtag | list | 288319 |
| mention_username | list | 20447 |
| mention_id | list | 20447 |
| sourcetweet_type | character | 0 |
| sourcetweet_id | character | 0 |
| sourcetweet_text | character | 0 |
| sourcetweet_author_id | character | 0 |
| text | character | 0 |
| possibly_sensitive | logical | 0 |
| author_id | character | 0 |
| user_username | character | 0 |
| user_name | character | 0 |
| user_description | character | 0 |
| user_profile_image_url | character | 0 |
| user_url | character | 0 |
| user_verified | logical | 0 |
| user_location | character | 230720 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| source | character | 0 |
| in_reply_to_user_id | character | 412615 |
| screen_name | character | 0 |
| created_at_round | POSIXct | 0 |


## retweeted_graph_test

- Number of rows: 182668
- Number of columns: 4
- Size: 53.83 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| word | character | 0 |
| in_degree | numeric | 0 |
| out_degree | numeric | 0 |
| betweenness | numeric | 0 |


## ridgeline.plot.data

- Number of rows: 357684
- Number of columns: 7
- Size: 13.65 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| created_at | POSIXct | 0 |
| retweeted | integer | 0 |
| quoted | integer | 0 |
| replyto | integer | 0 |
| uniques | integer | 0 |
| time.2 | Date | 0 |
| time.1 | POSIXct | 0 |


## ridgeline.plot.data.2

- Number of rows: 644
- Number of columns: 5
- Size: 0.02 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| time.2 | Date | 0 |
| uniques | integer | 0 |
| retweeted | integer | 0 |
| quoted | integer | 0 |
| replyto | integer | 0 |


## skip.gram.count

- Number of rows: 667875
- Number of columns: 3
- Size: 25.57 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| word1 | character | 0 |
| word2 | character | 0 |
| weight | integer | 0 |


## skip.gram.count.st.1

- Number of rows: 62275
- Number of columns: 3
- Size: 2.85 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| word1 | character | 0 |
| word2 | character | 0 |
| weight | integer | 0 |


## skip.gram.words

- Number of rows: 1586942
- Number of columns: 10
- Size: 389.96 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | POSIXct | 0 |
| text | character | 0 |
| hashtag | list | 655713 |
| created_at_round | POSIXct | 0 |
| text2 | character | 0 |
| clean.text | character | 0 |
| hashtag.clean | character | 0 |
| word1 | character | 0 |
| word2 | character | 0 |


## sourcetweet_usernames

- Number of rows: 9780
- Number of columns: 90
- Size: 29.97 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_id | character | 0 |
| status_id | character | 24 |
| created_at | POSIXct | 24 |
| screen_name | character | 0 |
| text | character | 24 |
| source | character | 24 |
| display_text_width | integer | 9780 |
| reply_to_status_id | character | 7591 |
| reply_to_user_id | character | 7547 |
| reply_to_screen_name | character | 7547 |
| is_quote | logical | 0 |
| is_retweet | logical | 0 |
| favorite_count | integer | 24 |
| retweet_count | integer | 24 |
| quote_count | integer | 9780 |
| reply_count | integer | 9780 |
| hashtags | list | 8428 |
| symbols | list | 9778 |
| urls_url | list | 6443 |
| urls_t.co | list | 6443 |
| urls_expanded_url | list | 6443 |
| media_url | list | 8062 |
| media_t.co | list | 8062 |
| media_expanded_url | list | 8062 |
| media_type | list | 8062 |
| ext_media_url | list | 8062 |
| ext_media_t.co | list | 8062 |
| ext_media_expanded_url | list | 8062 |
| ext_media_type | character | 9780 |
| mentions_user_id | list | 4524 |
| mentions_screen_name | list | 4524 |
| lang | character | 24 |
| quoted_status_id | character | 9780 |
| quoted_text | character | 9780 |
| quoted_created_at | POSIXct | 9780 |
| quoted_source | character | 9780 |
| quoted_favorite_count | integer | 9780 |
| quoted_retweet_count | integer | 9780 |
| quoted_user_id | character | 9780 |
| quoted_screen_name | character | 9780 |
| quoted_name | character | 9780 |
| quoted_followers_count | integer | 9780 |
| quoted_friends_count | integer | 9780 |
| quoted_statuses_count | integer | 9780 |
| quoted_location | character | 9780 |
| quoted_description | character | 9780 |
| quoted_verified | logical | 9780 |
| retweet_status_id | character | 6793 |
| retweet_text | character | 6793 |
| retweet_created_at | POSIXct | 6793 |
| retweet_source | character | 6793 |
| retweet_favorite_count | integer | 6793 |
| retweet_retweet_count | integer | 6793 |
| retweet_user_id | character | 9780 |
| retweet_screen_name | character | 9780 |
| retweet_name | character | 9780 |
| retweet_followers_count | integer | 9780 |
| retweet_friends_count | integer | 9780 |
| retweet_statuses_count | integer | 9780 |
| retweet_location | character | 9780 |
| retweet_description | character | 9780 |
| retweet_verified | logical | 9780 |
| place_url | character | 9593 |
| place_name | character | 9593 |
| place_full_name | character | 9593 |
| place_type | character | 9593 |
| country | character | 9593 |
| country_code | character | 9593 |
| geo_coords | list | 0 |
| coords_coords | list | 0 |
| bbox_coords | list | 0 |
| status_url | character | 24 |
| name | character | 0 |
| location | character | 0 |
| description | character | 0 |
| url | character | 6041 |
| protected | logical | 0 |
| followers_count | integer | 0 |
| friends_count | integer | 0 |
| listed_count | integer | 0 |
| statuses_count | integer | 0 |
| favourites_count | integer | 0 |
| account_created_at | POSIXct | 0 |
| verified | logical | 0 |
| profile_url | character | 6041 |
| profile_expanded_url | character | 6044 |
| account_lang | logical | 9780 |
| profile_banner_url | character | 587 |
| profile_background_url | character | 4758 |
| profile_image_url | character | 0 |


## sourcetweet_usernames_quoted

- Number of rows: 2647
- Number of columns: 90
- Size: 8.11 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_id | character | 0 |
| status_id | character | 18 |
| created_at | POSIXct | 18 |
| screen_name | character | 0 |
| text | character | 18 |
| source | character | 18 |
| display_text_width | integer | 2647 |
| reply_to_status_id | character | 1924 |
| reply_to_user_id | character | 1919 |
| reply_to_screen_name | character | 1919 |
| is_quote | logical | 0 |
| is_retweet | logical | 0 |
| favorite_count | integer | 18 |
| retweet_count | integer | 18 |
| quote_count | integer | 2647 |
| reply_count | integer | 2647 |
| hashtags | list | 2333 |
| symbols | list | 2646 |
| urls_url | list | 1818 |
| urls_t.co | list | 1818 |
| urls_expanded_url | list | 1818 |
| media_url | list | 2164 |
| media_t.co | list | 2164 |
| media_expanded_url | list | 2164 |
| media_type | list | 2164 |
| ext_media_url | list | 2164 |
| ext_media_t.co | list | 2164 |
| ext_media_expanded_url | list | 2164 |
| ext_media_type | character | 2647 |
| mentions_user_id | list | 1237 |
| mentions_screen_name | list | 1237 |
| lang | character | 18 |
| quoted_status_id | character | 2647 |
| quoted_text | character | 2647 |
| quoted_created_at | POSIXct | 2647 |
| quoted_source | character | 2647 |
| quoted_favorite_count | integer | 2647 |
| quoted_retweet_count | integer | 2647 |
| quoted_user_id | character | 2647 |
| quoted_screen_name | character | 2647 |
| quoted_name | character | 2647 |
| quoted_followers_count | integer | 2647 |
| quoted_friends_count | integer | 2647 |
| quoted_statuses_count | integer | 2647 |
| quoted_location | character | 2647 |
| quoted_description | character | 2647 |
| quoted_verified | logical | 2647 |
| retweet_status_id | character | 1941 |
| retweet_text | character | 1941 |
| retweet_created_at | POSIXct | 1941 |
| retweet_source | character | 1941 |
| retweet_favorite_count | integer | 1941 |
| retweet_retweet_count | integer | 1941 |
| retweet_user_id | character | 2647 |
| retweet_screen_name | character | 2647 |
| retweet_name | character | 2647 |
| retweet_followers_count | integer | 2647 |
| retweet_friends_count | integer | 2647 |
| retweet_statuses_count | integer | 2647 |
| retweet_location | character | 2647 |
| retweet_description | character | 2647 |
| retweet_verified | logical | 2647 |
| place_url | character | 2610 |
| place_name | character | 2610 |
| place_full_name | character | 2610 |
| place_type | character | 2610 |
| country | character | 2610 |
| country_code | character | 2610 |
| geo_coords | list | 0 |
| coords_coords | list | 0 |
| bbox_coords | list | 0 |
| status_url | character | 18 |
| name | character | 0 |
| location | character | 0 |
| description | character | 0 |
| url | character | 1588 |
| protected | logical | 0 |
| followers_count | integer | 0 |
| friends_count | integer | 0 |
| listed_count | integer | 0 |
| statuses_count | integer | 0 |
| favourites_count | integer | 0 |
| account_created_at | POSIXct | 0 |
| verified | logical | 0 |
| profile_url | character | 1588 |
| profile_expanded_url | character | 1590 |
| account_lang | logical | 2647 |
| profile_banner_url | character | 108 |
| profile_background_url | character | 1277 |
| profile_image_url | character | 0 |


## specific.time.1

- Number of rows: 168625
- Number of columns: 10
- Size: 36.99 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | POSIXct | 0 |
| text | character | 0 |
| hashtag | list | 120564 |
| created_at_round | POSIXct | 0 |
| text2 | character | 0 |
| clean.text | character | 0 |
| hashtag.clean | character | 0 |
| word1 | character | 0 |
| word2 | character | 0 |


## specific.time.1.extracted

- Number of rows: 168625
- Number of columns: 2
- Size: 4.64 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| word1 | character | 0 |
| word2 | character | 0 |


## specific.time.1.gephi

- Number of rows: 36905
- Number of columns: 5
- Size: 2.56 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_username | character | 0 |
| screen_name | character | 0 |
| device | character | 0 |
| tweet_type | character | 0 |
| created_at_round | POSIXct | 0 |


## st.1_edges

- Number of rows: 44751
- Number of columns: 5
- Size: 2.94 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| from | character | 0 |
| to | character | 0 |
| device | character | 0 |
| tweet_type | character | 0 |
| created_at_round | numeric | 0 |


## st.1_nodes

- Number of rows: 19849
- Number of columns: 2
- Size: 2.77 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| name | character | 0 |
| id | integer | 0 |


## st.mentions_df

- Number of rows: 1316
- Number of columns: 5
- Size: 0.12 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_username | character | 0 |
| screen_name | character | 0 |
| device | character | 0 |
| relationship_type | character | 0 |
| created_at_round | POSIXct | 0 |


## st.quoted_df

- Number of rows: 296
- Number of columns: 5
- Size: 0.04 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_username | character | 0 |
| screen_name | character | 0 |
| device | character | 0 |
| relationship_type | character | 0 |
| created_at_round | POSIXct | 0 |


## st.replyto_df

- Number of rows: 758
- Number of columns: 5
- Size: 0.08 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_username | character | 0 |
| screen_name | character | 0 |
| device | character | 0 |
| relationship_type | character | 0 |
| created_at_round | POSIXct | 0 |


## st.retweet_df

- Number of rows: 35851
- Number of columns: 5
- Size: 2.47 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_username | character | 0 |
| screen_name | character | 0 |
| device | character | 0 |
| relationship_type | character | 0 |
| created_at_round | POSIXct | 0 |


## st1.emoji.count

- Number of rows: 30
- Number of columns: 2
- Size: 0.00 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| emoji | character | 0 |
| n | integer | 0 |


## st1.joined.clean

- Number of rows: 44006
- Number of columns: 29
- Size: 40.82 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | character | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| url | list | 38560 |
| hashtag | list | 38483 |
| mention_username | list | 9478 |
| mention_id | list | 9478 |
| sourcetweet_type | character | 5028 |
| sourcetweet_id | character | 5028 |
| sourcetweet_text | character | 5028 |
| sourcetweet_author_id | character | 5028 |
| text | character | 0 |
| possibly_sensitive | logical | 0 |
| author_id | character | 0 |
| user_username | character | 0 |
| user_name | character | 0 |
| user_description | character | 0 |
| user_profile_image_url | character | 0 |
| user_url | character | 0 |
| user_verified | logical | 0 |
| user_location | character | 25382 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| source | character | 0 |
| in_reply_to_user_id | character | 42982 |


## st1.joined.clean.filtered

- Number of rows: 97
- Number of columns: 30
- Size: 0.10 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | POSIXct | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| url | list | 97 |
| hashtag | list | 97 |
| mention_username | list | 97 |
| mention_id | list | 97 |
| sourcetweet_type | character | 0 |
| sourcetweet_id | character | 0 |
| sourcetweet_text | character | 0 |
| sourcetweet_author_id | character | 0 |
| text | character | 0 |
| possibly_sensitive | logical | 0 |
| author_id | character | 0 |
| user_username | character | 0 |
| user_name | character | 0 |
| user_description | character | 0 |
| user_profile_image_url | character | 0 |
| user_url | character | 0 |
| user_verified | logical | 0 |
| user_location | character | 65 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| source | character | 0 |
| in_reply_to_user_id | character | 97 |
| created_at_round | POSIXct | 0 |


## st1.tweets.raw.df

- Number of rows: 5018
- Number of columns: 9
- Size: 5.46 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | POSIXct | 0 |
| text | character | 0 |
| hashtag | list | 3622 |
| created_at_round | POSIXct | 0 |
| text2 | character | 0 |
| clean.text | character | 0 |
| clean.text.2 | character | 0 |
| hashtag.clean | character | 0 |


## st1.whole_df

- Number of rows: 38221
- Number of columns: 5
- Size: 2.64 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_username | character | 0 |
| screen_name | character | 0 |
| device | character | 0 |
| relationship_type | character | 0 |
| created_at_round | POSIXct | 0 |


## st1.whole_graph_centralities

- Number of rows: 16601
- Number of columns: 6
- Size: 7.40 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| word | character | 0 |
| in_degree | numeric | 0 |
| out_degree | numeric | 0 |
| betweenness | numeric | 0 |
| closeness | numeric | 921 |
| eigen | numeric | 0 |


## st1.word.count

- Number of rows: 12593
- Number of columns: 2
- Size: 0.89 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| word | character | 0 |
| n | integer | 0 |


## st1.words.df

- Number of rows: 91833
- Number of columns: 9
- Size: 21.73 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | POSIXct | 0 |
| text | character | 0 |
| hashtag | list | 65712 |
| created_at_round | POSIXct | 0 |
| text2 | character | 0 |
| clean.text | character | 0 |
| word | character | 0 |
| word.non.tr | character | 0 |


## test

- Number of rows: 10
- Number of columns: 29
- Size: 0.03 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | character | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| url | list | 8 |
| hashtag | list | 7 |
| mention_username | list | 6 |
| mention_id | list | 6 |
| sourcetweet_type | character | 3 |
| sourcetweet_id | character | 3 |
| sourcetweet_text | character | 3 |
| sourcetweet_author_id | character | 3 |
| text | character | 0 |
| possibly_sensitive | logical | 0 |
| author_id | character | 0 |
| user_username | character | 0 |
| user_name | character | 0 |
| user_description | character | 0 |
| user_profile_image_url | character | 0 |
| user_url | character | 0 |
| user_verified | logical | 0 |
| user_location | character | 5 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| source | character | 0 |
| in_reply_to_user_id | character | 3 |


## tidy.output

- Number of rows: 478278
- Number of columns: 31
- Size: 332.80 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| tweet_id | character | 0 |
| user_username | character | 0 |
| text | character | 0 |
| lang | character | 0 |
| created_at | character | 0 |
| conversation_id | character | 0 |
| possibly_sensitive | logical | 0 |
| source | character | 0 |
| author_id | character | 0 |
| user_location | character | 258591 |
| user_description | character | 0 |
| user_name | character | 0 |
| user_protected | logical | 0 |
| user_created_at | character | 0 |
| user_profile_image_url | character | 0 |
| user_verified | logical | 0 |
| user_pinned_tweet_id | character | 258374 |
| user_url | character | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| sourcetweet_type | character | 58016 |
| sourcetweet_id | character | 58016 |
| sourcetweet_text | character | 58016 |
| sourcetweet_lang | character | 58016 |
| sourcetweet_author_id | character | 58016 |
| in_reply_to_user_id | character | 470434 |


## top.emoji

- Number of rows: 30
- Number of columns: 2
- Size: 0.00 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| emoji | character | 0 |
| n | integer | 0 |


## tweet.count.heatmap

- Number of rows: 15804
- Number of columns: 6
- Size: 0.48 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| day | integer | 0 |
| hour | integer | 0 |
| month | numeric | 0 |
| year | numeric | 0 |
| value | integer | 0 |
| variable | factor | 0 |


## tweets.raw.df

- Number of rows: 58016
- Number of columns: 9
- Size: 62.74 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | POSIXct | 0 |
| text | character | 0 |
| hashtag | list | 25106 |
| created_at_round | POSIXct | 0 |
| text2 | character | 0 |
| clean.text | character | 0 |
| clean.text.2 | character | 0 |
| hashtag.clean | character | 0 |


## uniques

- Number of rows: 58016
- Number of columns: 31
- Size: 69.35 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | POSIXct | 0 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| url | list | 21567 |
| hashtag | list | 25106 |
| mention_username | list | 48480 |
| mention_id | list | 48480 |
| sourcetweet_type | character | 0 |
| sourcetweet_id | character | 58016 |
| sourcetweet_text | character | 58016 |
| sourcetweet_author_id | character | 58016 |
| text | character | 0 |
| possibly_sensitive | logical | 0 |
| author_id | character | 0 |
| user_username | character | 0 |
| user_name | character | 0 |
| user_description | character | 0 |
| user_profile_image_url | character | 0 |
| user_url | character | 0 |
| user_verified | logical | 0 |
| user_location | character | 24208 |
| user_followers_count | integer | 0 |
| user_following_count | integer | 0 |
| user_tweet_count | integer | 0 |
| user_list_count | integer | 0 |
| source | character | 0 |
| in_reply_to_user_id | character | 50261 |
| screen_name | character | 51054 |
| created_at_round | POSIXct | 0 |


## uniques_df

- Number of rows: 58016
- Number of columns: 5
- Size: 4.17 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_username | character | 0 |
| screen_name | character | 51054 |
| device | character | 0 |
| relationship_type | character | 0 |
| created_at_round | POSIXct | 0 |


## uniques.reactable

- Number of rows: 58016
- Number of columns: 11
- Size: 44.67 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| url | list | 21567 |
| created_at | character | 0 |
| text | character | 0 |
| hashtag | list | 25106 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| author_id | character | 0 |
| user_username | character | 0 |
| user_location | character | 24208 |


## uniques.reactable.clean

- Number of rows: 58016
- Number of columns: 9
- Size: 39.42 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | character | 0 |
| username | character | 0 |
| tweet | glue | 0 |
| hashtag | list | 25106 |
| retweet_count | integer | 0 |
| like_count | integer | 0 |
| quote_count | integer | 0 |
| user_location | character | 24208 |


## vanilla.format

- Number of rows: 478278
- Number of columns: 15
- Size: 1767.02 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| entities | data.frame | 0 |
| lang | character | 0 |
| text | character | 0 |
| created_at | character | 0 |
| conversation_id | character | 0 |
| possibly_sensitive | logical | 0 |
| public_metrics | data.frame | 0 |
| source | character | 0 |
| author_id | character | 0 |
| referenced_tweets | list | 0 |
| attachments | data.frame | 0 |
| geo | data.frame | 955103 |
| withheld | data.frame | 953908 |
| in_reply_to_user_id | character | 470434 |


## whole_df

- Number of rows: 443811
- Number of columns: 5
- Size: 29.16 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| user_username | character | 0 |
| screen_name | character | 0 |
| device | character | 0 |
| relationship_type | character | 0 |
| created_at_round | POSIXct | 0 |


## word.count

- Number of rows: 83745
- Number of columns: 2
- Size: 5.97 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| word.non.tr | character | 0 |
| n | integer | 0 |


## words.df

- Number of rows: 880412
- Number of columns: 9
- Size: 231.50 MB

### Columns

| Column Name | Type | Missing Values |
|------------|------|----------------|
| id | character | 0 |
| created_at | POSIXct | 0 |
| text | character | 0 |
| hashtag | list | 365500 |
| created_at_round | POSIXct | 0 |
| text2 | character | 0 |
| clean.text | character | 0 |
| word | character | 0 |
| word.non.tr | character | 0 |



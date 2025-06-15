
# Let us load the required libraries.

library(academictwitteR)

# Data Wrangling and Visualization
library(glue)
library(cowplot)
library(magrittr)
library(plotly)
library(tidyverse)
library(widyr)
# Date & Time Manipulation.
library(hms)
library(lubridate) 
# Text Mining
library(tidytext)
library(tm)
library(wordcloud)
# Network Analysis
library(igraph)
# Network Visualization (D3.js)
library(networkD3)

library(academictwitteR)

set_bearer()


# COUNT TWEETS - TIME SERIES ANALYSIS

pinargultekin <- count_all_tweets(query = c("Pınar Gültekin", "#PınarGültekin", "#PınarGültekinİçinAdalet"),
                                  start_tweets = "2020-07-16T00:00:00Z",
                                  end_tweets = "2022-05-05T12:00:00Z",
                                  bearer_token = get_bearer(),
                                  granularity = "hour",
                                  n = 600000)

#calculate total number of tweets

sum(pinargultekin$tweet_count, na.rm=TRUE)

sum(pinargultekin$tweet_sayisi, na.rm=TRUE)

#change timezone to Istanbul

library(lubridate)

pinargultekin$end = ymd_hms(pinargultekin$end,
                                 tz = "Europe/Istanbul")

pinargultekin = subset(pinargultekin, select = c(end, tweet_count))
names(pinargultekin) <- c("tarih", "tweet_sayisi")

#plotting

library(ggplot2)

gg1 <- ggplot(data = pinargultekin,
              aes(x = tarih, y = tweet_sayisi)) +
  geom_line(lwd = 0.5) +
  coord_cartesian(ylim = c(0, 10000)) + #Grafikte görünen saatlik tweet sayısı üst limitini 10000 olarak belirledik.
  theme(text = element_text(family = "Times New Roman"))

gg1


#We now plot the time series of tweets per hour (Interactive version)

library(plotly)

gg2 <- pinargultekin %>% 
  ggplot(mapping = aes(x = tarih, y = tweet_sayisi)) +
  theme_light() +
  geom_line() +
  xlab(label = 'Tarih') +
  ylab(label = 'Tweet Sayisi') +
  coord_cartesian(ylim = c(0, 10000)) +
  theme(text = element_text(family = "Times New Roman"))
ggtitle(label = 'Saatte atılan tweet sayısı')

gg2 %>% ggplotly()




# DOWNLOAD TWEETS


get_all_tweets(
  query = c("Pınar Gültekin", "#PınarGültekin", "#PınarGültekinİçinAdalet"),
  start_tweets = "2020-07-21T10:00:00Z",
  end_tweets = "2022-05-05T10:00:00Z",
  lang = "tr",
  file = "pinargultekin",
  data_path = "pg-tweet-data",
  n = 632200,
)

#Vanilla format output (to receive the tweets in the same order with tidy format we extract from data file again)

vanilla <- "pg-tweet-data/"
vanilla.format <- bind_tweets(vanilla)


# Tidy Output: To get more information (e.g. user info and sourcetweets).
tidy.output <- bind_tweets(data_path = "pg-tweet-data", user = TRUE, output_format = "tidy")

# Merge two outputs

addconsecutivenumbers1 <- cbind(vanilla.format, "observation"=1:nrow(vanilla.format))
addconsecutivenumbers2 <- cbind(tidy.output, "observation"=1:nrow(tidy.output))
joined <- merge(addconsecutivenumbers1, addconsecutivenumbers2, by="observation")

# Extract "Entities: When we extract the columns are still a list, later we will unlist them.

joined_entities <- as.data.frame(joined$entities)

# this step extract hashtags, urls, mentions, mention-ids: Extract hashtags (Hashtags > Tag (3rd column)) from hashtag list


joined_entities.hashtag <- joined_entities %>%
  select(hashtags) %>%
  hoist(hashtags, hashtag = 3)

#Extract urls

joined_entities.url <- joined_entities %>%
  select(urls) %>%
  hoist(urls, url= 3) 


#Extract mentions

joined_entities.mentions <- joined_entities %>%
  select(mentions) %>%
  hoist(mentions, mention_username= 3)


#Extract mention ids

joined_entities.mention_ids <- joined_entities %>%
  select(mentions) %>%
  hoist(mentions, mention_id= 4)

# combine extracted columns into a new data frame. later we will combine it with the original data frame.

df.extracted <- data.frame(joined_entities.hashtag, joined_entities.url, joined_entities.mentions,joined_entities.mention_ids)
df.extracted = subset(df.extracted, select = c(hashtag, url, mention_username, mention_id))

# we now convert NULL rows into NA in several columns in df.extracted

df.extracted = mutate_all(df.extracted, list(~na_if(.,"NULL")))

#or 

df.extracted[df.extracted == "NULL"] <- NA

# let"s combine joined and df.extracted. now we have all the columnns we need (more than we need :) )

addconsecutivenumbers3 <- cbind(df.extracted, "observation"=1:nrow(df.extracted)) 

joined <- merge(joined, addconsecutivenumbers3, by="observation")

# let's count the frequency of a selected column

joined %>%
  count(sourcetweet_type, name = "frequency") # shows number of quoted, retweeted and unique tweets.


# NOT USED! You can use this line if there are duplicated in the data.
removeduplicates_merged.data <-distinct(joined, id, .keep_all= TRUE)

# Keep only necessary columns

joined.clean = subset(joined, select = c(id, created_at.x, retweet_count, like_count, quote_count, url, hashtag, mention_username, mention_id, sourcetweet_type,
                                         sourcetweet_id, sourcetweet_text, sourcetweet_author_id, text.x, possibly_sensitive.x, author_id.x, user_username, user_name, user_description,user_profile_image_url,
                                         user_url, user_verified, user_location, user_followers_count, user_following_count, user_tweet_count, user_list_count, source.x, in_reply_to_user_id.x))

# remove .x pattern from column names to have a clean data column names.

for ( col in 1:ncol(joined.clean )){
  colnames(joined.clean )[col] <-  sub(".x", "", colnames(joined.clean )[col])
}

# these column names changed too so i renamed those .

colnames(joined.clean)[colnames(joined.clean) %in% c("sourcetweet_tt", "tt.x")] <- c("sourcetweet_text", "text")

# or 
# (this is a better solution to remove .x at the end of the column names)


joined.clean <- joined.clean %>% rename_with(~str_remove(., "\\.x$")) %>% as_tibble()


# Create new data with "only retweets", "quoted" and "NA - no retweets or quotes".

retweeted <- filter(joined.clean, sourcetweet_type == "retweeted")
quoted <- filter(joined.clean, sourcetweet_type == "quoted")
uniques <- joined.clean %>% filter(is.na(sourcetweet_type))

# I added this late (10 october 2023). There were still duplicates in uniques data frame. I removed the duplicate tweets.
# I prepared uniques_final_nvivo db for Zuleyha. She is going to use it on Nvivo (qualitative)
uniques_final <- uniques[!duplicated(uniques$text), ]
uniques_final_nvivo <- uniques_final %>%
  select(user_username, created_at, text)

# There are always missing values (NA) in mention_username column. 
# So I create a new column (sourcetweet_usernames) with the help of RTWEET 'lookup_users' function, by using the "sourcetweet_author_id"


#extract the unique "sourcetweet_author_id"s. we will find users names of those ids, with rtweet's 'lookup_users' function.

remove_duplicates_retweeted <- distinct(retweeted, sourcetweet_author_id, .keep_all=TRUE)

library(rtweet)

sourcetweet_usernames <- lookup_users(as_userid(remove_duplicates_retweeted$sourcetweet_author_id))


#Now we have all the users names of the sourcetweet_author_ids.
# this converts user ids to user names based on the data above and create a new column (screen_name) on my original dataset.

retweeted <- retweeted %>%
  left_join(
    select(sourcetweet_usernames, sourcetweet_author_id = user_id, screen_name)
  )



#  !NOT USED! the code above created some duplicates. let's remove them. (this time it did not created duplicates. keep the code here anyway)
retweeted <-distinct(retweeted, id, .keep_all= TRUE)


#check the errors before and after 

retweeted %>%
  count(screen_name, name = "frequency")

retweeted %>%
  count(is.na(mention_username), name = "frequency") #is.na = 20451

retweeted %>%
  count(is.na(screen_name), name = "frequency") #is.na = 27


# before cleaning missibg values were 20451, now there are 27. I will delete those 27 rows with NA value in "screen_name" column.

retweeted <- retweeted %>% filter(!is.na(screen_name))


##
# Follow the same procedure for "quotes" tweets data

remove_duplicates_quoted <- distinct(quoted, sourcetweet_author_id, .keep_all=TRUE) # extract the unique "sourcetweet_author_id"s
sourcetweet_usernames_quoted <- lookup_users(as_userid(remove_duplicates_quoted$sourcetweet_author_id))

quoted <- quoted %>%
  left_join(
    select(sourcetweet_usernames_quoted, sourcetweet_author_id = user_id, screen_name)
  )


quoted %>%
  count(is.na(screen_name), name = "frequency") #ıs.na = 5

quoted <- quoted %>% filter(!is.na(screen_name))



##
# Get in_reply_to usernames at "unique" data as some of those tweets are replies.
# The data has in_reply_to_user_id. we will convert those to usernames following similar steps.

#extract the unique "in_reply_to_user_id"s. we will find users names of those ids, with rtweet's 'lookup_users' function.

sum(is.na(uniques$in_reply_to_user_id)) # 50261 NA, 7755 not NA


remove_duplicates_uniques <- distinct(uniques, in_reply_to_user_id, .keep_all=TRUE)

library(rtweet)

in_reply_to_usernames <- lookup_users(as_userid(remove_duplicates_uniques$in_reply_to_user_id))


# Now we have all the users names of the in_reply_to_user_id.
# this converts user ids to user names based on the data above and create a new column (reply_to_username) on my original dataset.

uniques <- uniques %>%
  left_join(
    select(in_reply_to_usernames, in_reply_to_user_id = user_id, screen_name)
  )

# adding info to "sourcetweet_type" based on "screen_name". If it is not NA, sourcetweet_type is "replyto", otherwise NA.
# source: https://www.marsja.se/r-add-column-to-dataframe-based-on-other-columns-conditions-dplyr/

uniques <- uniques %>% 
  mutate(sourcetweet_type = if_else(!is.na(screen_name), "replyto", ""))



### DATA IS NOW READY FOR FURTHER ANALYSIS


#######

# ANALYZING TWITTER NETWORKS (RETWEETS, QUOTES)

#prepare data for social network analysis



# I add date column to data to filter it by date for SNA in the following analysis

# convert "created_at" column into a date format with lubridate package.

library(lubridate)

retweeted$created_at = ymd_hms(retweeted$created_at)
quoted$created_at = ymd_hms(quoted$created_at)
uniques$created_at = ymd_hms(uniques$created_at)

# add a more simple date column only includes days.

retweeted %<>% 
  mutate(created_at_round = created_at %>% round_date(unit = "day")) 
quoted %<>% 
  mutate(created_at_round = created_at %>% round_date(unit = "day"))
uniques %<>% 
  mutate(created_at_round = created_at %>% round_date(unit = "day"))



# create df for network graph. the simple method only includes eges list.

retweet_df <- retweeted[, c("user_username","screen_name")] #create df of nodes and edges "retweeted"

quoted_df <- quoted[, c("user_username","screen_name")] #create df of nodes and edges "quoted"

  # or ( including edge attributes)

retweet_df <- retweeted %>%
  select(user_username, screen_name, device = source, relationship_type = sourcetweet_type, created_at_round) # first two will be the edge list, additional columns as edge attributes 

quoted_df <- quoted %>%
  select(user_username, screen_name, device = source, relationship_type = sourcetweet_type, created_at_round)

uniques_df <- uniques %>%
  select(user_username, screen_name, device = source, relationship_type = sourcetweet_type, created_at_round)


# adding Mentions Data Frame

mentions <- rbind(quoted, uniques)

mentions_df <- mentions %>% # mention_user name seperation u bu linkten uyarldım: https://rpubs.com/TeraPutera/social_network_analysis
  select(user_username,  mention_username, device = source, relationship_type = sourcetweet_type, created_at_round) %>%
  separate_rows(mention_username, sep = " ") %>%
  filter(mention_username != "") %>%
  mutate(relationship_type ="mention")



#edge lists convert to lowercase


retweet_df <- retweet_df %>%
  mutate(user_username = user_username %>% str_to_lower) %>%
  mutate(screen_name = screen_name %>% str_to_lower) # convert to lowercase


quoted_df <- quoted_df %>%
  mutate(user_username = user_username %>% str_to_lower) %>%
  mutate(screen_name = screen_name %>% str_to_lower) # convert to lowercase

uniques_df <- uniques_df %>% # NOT USED! Mentions_df için ayrı df olduğu için bunu kullanmaya gerek yok artık.
  mutate(user_username = user_username %>% str_to_lower) %>% 
  mutate(screen_name = screen_name %>% str_to_lower) # convert to lowercase


replyto_df <- filter(uniques_df, !is.na(screen_name)) # create a df for replyto tweets

mentions_df<- mentions_df %>%
  mutate(user_username = user_username %>% str_to_lower) %>% # convert to lowercase
  mutate(mention_username = mention_username %>% str_to_lower) %>%
  rename(screen_name = mention_username)
  


head(retweet_df)
count(retweet_df, user_username, screen_name)

# create graph for each (retweet, quoted, and uniques)

retweet_graph <- graph_from_data_frame(d=retweet_df, directed = T) #create network graph "retweeted"

quoted_graph <- graph_from_data_frame(d=quoted_df, directed = T) #create network graph "quoted"

replyto_graph <- graph_from_data_frame(d=replyto_df, directed = T) #create network graph "uniques"(includes replyto)

mentions_graph <- graph_from_data_frame(d=mentions_df, directed = T)

# create graph for the whole data.

whole_df <- rbind(retweet_df, quoted_df, replyto_df, mentions_df)
whole_graph <- graph_from_data_frame(d=whole_df, directed = T)



summary(retweet_graph) # shows the number of nodes and edges
summary(quoted_graph)
summary(replyto_graph)
summary(mentions_graph)
summary(whole_graph)

#or
vcount(retweet_graph)
ecount(retweet_graph)


# Export data as .gml format for further data visualization with Gephi

 # Simplified (includes only edges list)

write_graph(simplify(retweet_graph), "pinar_gultekin_retweet.gml", format = "gml") #export "retweeted" network graph for gephi

write_graph(simplify(quoted_graph), "pinar_gultekin_quoted.gml", format = "gml") #export "quoted" network graph for gephi

#or

 # Detailed (includes edge attributes which allow us to make detailed visualizations)

write_graph(retweet_graph, "pinar_gultekin_retweet.gml", format = "gml")
write_graph(quoted_graph, "pinar_gultekin_quoted.gml", format = "gml" )
write_graph(replyto_graph, "pinar_gultekin_replyto.gml", format = "gml")
write_graph(whole_graph, "pinar_gultekin_whole.gml", format = "gml" )


################### !CORRELATIONS - 

retweeted_graph_test <- tibble(
  word = V(retweet_graph)$name,
  in_degree = degree(graph = retweet_graph, mode = c("in")),
  out_degree = degree(graph = retweet_graph, mode = c("out")),
  betweenness = betweenness(graph = retweet_graph)
)


cinna_graph <- graph_from_data_frame(d=retweeted_graph_test , directed = T)

library(CINNA)


pca_centralities(
  retweeted_graph_test[2:4],
  scale.unit = TRUE,
  cut.off = 80,
  ncp = 5,
  graph = FALSE,
  axes = c(1, 2)
)


visualize_pair_correlation(retweeted_graph_test$out_degree, retweeted_graph_test$in_degree, scale = TRUE)

visualize_correlations(retweeted_graph_test[,2:4], scale = TRUE, method = "pearson")

#correlation graph, method1
visualize_correlations(node.impo.df[,2:4], scale = TRUE, method = "pearson")

#corrrelation graphö method2
pairs(node.impo.df[,2:4]) # source: https://r-coder.com/correlation-plot-r/

#correlation graph, method3
library(ggplot2)
library(ggpubr)

ggplot(node.impo.df, aes( x=degree, y=betweenness ))+
  geom_point(pch=10)+
  stat_cor(method = "spearman", label.x = -5, label.y = 30)

##############





# let's analyze the influence of the users based on three indices:
#resource: https://www.rpubs.com/chenfw/analysis_of_twitter_data_with_r

# the out-degree: of a user indicates the number of times the user retweets posts.
# higher out-degree score can be used as a medium to retweet posts.

V(retweet_graph)$id <- 1:vcount(retweet_graph) # add node attribute id

V(quoted_graph)$id <- 1:vcount(quoted_graph)

#create data frames containing the nodes and edges (ties).

retweet_network_df <- as_data_frame(retweet_graph, what = "both")
retweet_nodes <- retweet_network_df$vertices
retweet_edges <- retweet_network_df$edges


quoted_network_df <- as_data_frame(quoted_graph, what = "both")
quoted_nodes <- quoted_network_df$vertices
quoted_edges <- quoted_network_df$edges


# calculate the out-degree scores\ sort the nodes based on these scores, and view the top 10

out_degree <- degree(retweet_graph, mode = c("out"))
out_degree_sort <- sort(out_degree, decreasing = TRUE)
out_degree_sort[1:20]

out_degree_quoted <- degree(quoted_graph, mode = c("out"))
out_degree_sort_quoted <- sort(out_degree_quoted, decreasing = TRUE)
out_degree_sort_quoted[1:20]

# the in-degree: the number of times the user's posts are retweeted.

in_degree <- degree(retweet_graph, mode = c("in"))
in_degree_sort <- sort(in_degree, decreasing = TRUE)
in_degree_sort[1:20]

in_degree_quoted <- degree(quoted_graph, mode = c("in"))
in_degree_sort_quoted <- sort(in_degree_quoted, decreasing = TRUE)
in_degree_sort_quoted[1:20]

# betweenness: of user represents the degree to which the user stands between two other usere who are not connected.

betwn_nw <- betweenness(retweet_graph, directed = TRUE)
betwn_nw_sort <- betwn_nw %>%
  sort(decreasing = TRUE) %>%
  round()
betwn_nw_sort[1:20]

betwn_nw_quoted <- betweenness(quoted_graph, directed = TRUE)
betwn_nw_sort_quoted <- betwn_nw_quoted %>%
  sort(decreasing = TRUE) %>%
  round()
betwn_nw_sort_quoted[1:20]

# Add the score to the nodes.

retweet_nodes_scores <- retweet_nodes %>%
  mutate(out_degree = out_degree) %>%
  mutate(in_degree = in_degree) %>%
  mutate(betweenness = betwn_nw)

quoted_nodes_scores <- quoted_nodes %>%
  mutate(out_degree = out_degree_quoted) %>%
  mutate(in_degree = in_degree_quoted) %>%
  mutate(betweenness = betwn_nw_quoted)



#################

# TEXT ANALYSIS

# I'm creating a data frame that includes ID, Created at and Text as in the example

tweets.raw.df = subset(uniques, select = c( id, created_at, text, hashtag))


# let us see the structure of this tibble

tweets.raw.df %>% glimpse()


# convert "created_at" column into a date format with lubridate package.

library(lubridate)

tweets.raw.df$created_at = ymd_hms(tweets.raw.df$created_at)

#change timezone to Istanbul

tweets.raw.df$created_at = ymd_hms(tweets.raw.df$created_at,
                                   tz = "Europe/Istanbul" )


# We create a new variable which “forgets” the seconds and minutes of "created_at" column.
# If I wrıte 'minutes' yazsaydım sadece seconds u unutacaktı.i would only forget seconds.

tweets.raw.df %<>% 
  mutate(created_at_round = created_at %>% round(units = 'hours') %>% as.POSIXct())


#We now plot the time series of tweets per hour

plt <- tweets.raw.df %>% 
  count(created_at_round) %>% 
  ggplot(mapping = aes(x = created_at_round, y = n)) +
  theme_light() +
  geom_line() +
  xlab(label = 'Date') +
  ylab(label = NULL) +
  ggtitle(label = 'Number of Tweets per Hour')

plt %>% ggplotly()


#lets say there is an interesting peak in a specific time. Let us look at those  tweets

results.time <- as.POSIXct(x = '2020-07-023 16:00:00')

# check the filtered tweets (in my case i need the twitter accounts, so i keep them in the text, you can disable usernames by adding :  filter(!str_detect(string = text, pattern = '@')) %>% 

tweets.raw.df %>% 
  filter(created_at_round > results.time ) %>% 
  select(text) %>% 
  pull(text) %>% 
  head(20) 





# Turkish capital letter like İ, Ş, Ç were causing problem when making all text to_lower. So I added 'İ' = 'I' to the replacement list, and apply it before text cleaning.

# Replace accents

replacement.list <- list('α' = 'a', 'á' = 'a', 'é' = 'e', 'í' = 'i', 'ó' = 'o', 'ú' = 'u', 'İ' = 'i', 'Ş' = 's', 'Ü' = 'u', 'Ö' = 'o', 'Ğ' = 'g', 'Ç' = 'c')

# Replace Turkish accents (I created two different lists. because if i combine them and apply it in the beginning stopwords dictionary doe not work effectively because of missing turkish charcters)
replacement.list.turkish <- list('ç' = 'c', 'ğ' = 'g', 'ş' = 's', 'ı' = 'i', 'ü' = 'u', 'ö' = 'o')


tweets.raw.df <- dplyr::mutate(tweets.raw.df, text = chartr(old = names(replacement.list) %>% str_c(collapse = ''),
                                                            new = replacement.list %>% str_c(collapse = ''),
                                                            x = text))


# text cleaning pre (only to lowercase): I do it to apply stopwords with no problem. all words in the dictionary are in lower case
# I apply this code after replacemenet list, because it would create problems when to_lower Turkish capital chartacters.

textcleaning.pre <- function(x) {
  x %>%
    str_to_lower()
  
}

tweets.raw.df <-tweets.raw.df %>% 
  mutate(text = textcleaning.pre(text))



# I remove stopwords in the beginning. because it will not work effectively after replacing Turkish characters with non-Turkish characters.

library(stopwords)

turkish.stopwords <- stopwords::stopwords("tr", source = "stopwords-iso")


# Let's convert our text into a corpus to work on tm and remove stopwords.

corpus.text.stopwords <-  Corpus(x = VectorSource(x = tweets.raw.df$text))


tweets.text.stopwords <- corpus.text.stopwords %>%
  tm_map(removeWords, turkish.stopwords)


# Recover data into original tibble (i create"text2" for stopwords applied text).

tweets.raw.df %<>% mutate(text2 = tweets.text.stopwords$content)




# Text Cleaning
# Resource: https://stackoverflow.com/questions/67845605/streamlining-cleaning-tweet-text-with-stringr

textcleaning <- function(x) {
  x %>%
    str_remove_all(" ?(f|ht)(tp)(s?)(://)(.*)[.|/](.*)") %>%
    str_replace_all("&amp;", "and") %>%
    str_remove_all("[[:punct:]]") %>%
    str_remove_all("^RT:? ") %>%
    str_remove_all("@[[:alnum:]]+") %>%
    str_remove_all("#[[:alnum:]]+") %>%
    str_replace_all("\\\n", " ") %>%
    str_to_lower() %>%
    str_trim("both")
}



# I include "clean.text" column to my df.

tweets.raw.df <-tweets.raw.df %>% 
  mutate(clean.text = textcleaning(text2))



# Do more cleaning with 'tm' package. We will convert our text into a corpus to work on tm

corpus <-  Corpus(x = VectorSource(x = tweets.raw.df$clean.text))


tweets.text<- corpus %>%
  tm_map(removePunctuation) %>%
  tm_map(removeNumbers) %>%
  tm_map(removeWords, turkish.stopwords) %>%
  tm_map(PlainTextDocument)


# Recover data into original tibble. (I keep "clean.text" column and create "clean.text.2" to show the difference between two to my students)

tweets.raw.df %<>% mutate(clean.text.2 = tweets.text[[1]]$content)


## Words count

# Words from Tweets

words.df <- tweets.raw.df %>% 
  unnest_tokens(input = clean.text.2, output = word)

# Remove Turkish characters (replacement.list.turkish)


# Create "word.non.tr column which includes word with nonTurkish characters.

words.df <- dplyr::mutate(words.df, word.non.tr = chartr(old = names(replacement.list.turkish) %>% str_c(collapse = ''),
                                                         new = replacement.list.turkish %>% str_c(collapse = ''),
                                                         x = word))


#Count the words 

word.count <- words.df %>% count(word.non.tr, sort = TRUE)

word.count %>% head(40)


#Visualize word count

plt <- word.count %>% 
  # Set count threshold. 
  filter(n > 1500) %>%
  mutate(word.non.tr = reorder(word.non.tr, n)) %>%
  ggplot(aes(x = word.non.tr, y = n)) +
  theme_light() + 
  geom_col(fill = 'black', alpha = 0.8) +
  xlab(NULL) +
  coord_flip() +
  ggtitle(label = 'Top Word Count')

plt %>% ggplotly()

#Create a wordcloud of top words

library(wordcloud2)

set.seed(1234)
wordcloud2(data = word.count, size = 4, minSize = 0, shape = 'pentagon')


# Count and create a wordcloud for Hashtags

# We need to prepare the "hashtag" column to clean and later count it. This method helped me to do it (Convert values to character):
# Resource: https://stackoverflow.com/questions/57465241/error-in-check-inputx-input-must-be-a-character-vector-of-any-length-or-a-li

tweets.raw.df <- mutate(tweets.raw.df, hashtag.clean = as.character(tweets.raw.df$hashtag))


# Replace accents

tweets.raw.df <- dplyr::mutate(tweets.raw.df, hashtag.clean = chartr(old = names(replacement.list) %>% str_c(collapse = ''),
                                                                     new = replacement.list %>% str_c(collapse = ''),
                                                                     x = hashtag.clean))
# Lower case all letters

tweets.raw.df <-tweets.raw.df %>% 
  mutate(hashtag.clean = textcleaning.pre(hashtag.clean))


# Convert to non-Turkish characters

tweets.raw.df <- dplyr::mutate(tweets.raw.df, hashtag.clean = chartr(old = names(replacement.list.turkish) %>% str_c(collapse = ''),
                                                                     new = replacement.list.turkish %>% str_c(collapse = ''),
                                                                     x = hashtag.clean))




# Create a new df including the hashtag (-splitted hashtag column into its tokens-) and its creation date. we will need it to visualize the volume of hashtags over time.


hashtags.unnested.df <- tweets.raw.df %>% 
  select(created_at_round, hashtag.clean) %>% 
  unnest_tokens(input = hashtag.clean, output = hashtag) 


# Remove specific values from the hashtag.clean (c and NA)
# Alternatively:  We could also remove NA values in the beginning, before converting "hashtah" column to as.characterç

hashtags.unnested.df<-subset(hashtags.unnested.df, hashtag!="c" & hashtag!="na")


# Hashtag.count

hashtag.count <- hashtags.unnested.df %>% count(hashtag, sort = TRUE)


# The data is not yet clean. Find and Replace (combined) matched patterns
# Later we re-run hastag.count.

hashtags.unnested.df$hashtag <- hashtags.unnested.df$hashtag %>%
  str_replace_all(c("pinargueltekin" = "pinargultekin", "pinargueltekinicinadalet" = "pinargultekinicinadalet", "rtecevapvertuerkmilletisoruyor" = "rtecevapverturkmilletisoruyor", "istanbulsoezlesmesiyasatir" = "istanbulsozlesmesiyasatir",
                    "istanbulsoezlesmesi" = "istanbulsozlesmesi", "guelistandokunerede" = "gulistandokunerede"))


# Remove irrelevant hashtags (I can add more hashtags here later)

hashtag.count<-subset(hashtag.count, hashtag!="dgs2021" & hashtag!="copaamericafinal" & hashtag!="arveles" & hashtag!="gateio800kmilestone" & hashtag!="piknigeyasak")

# Hashtag count wordcloud

set.seed(1234)
wordcloud2(data = hashtag.count, size = 4, minSize = 0, shape = 'pentagon')

# Visualize the Hashtag Counts

plt.hashtag <- hashtag.count %>% 
  # Set count threshold. 
  filter(n > 100) %>%
  mutate(hashtag= reorder(hashtag, n)) %>%
  ggplot(aes(x = hashtag, y = n)) +
  theme_light() + 
  geom_col(fill = 'black', alpha = 0.8) +
  xlab(NULL) +
  coord_flip() +
  ggtitle(label = 'Top Hashtag Count')

plt.hashtag %>% ggplotly()


#Let's compare the valume development of popular hastags over time. (hashtag.unnested.df includes the creation date of the hashtag. we will sue that data)

plt.hashtag.time <- hashtags.unnested.df %>% 
  filter(hashtag %in% c('istanbulsozlesmesiyasatir', '8martdunyakadinlargunu')) %>% 
  count(created_at_round, hashtag) %>% 
  ggplot(mapping = aes(x  = created_at_round, y = n, color = hashtag)) +
  theme_light() + 
  xlab(label = 'Date') +
  ggtitle(label = 'Top Hastags Counts') +
  geom_line() + 
  scale_color_manual(values = c('8martdunyakadinlargunu' = 'green3', 'istanbulsozlesmesiyasatir' = 'purple'))


plt.hashtag.time %>% ggplotly()


# Extract emojis
# Source: # https://stackoverflow.com/questions/67845605/streamlining-cleaning-tweet-text-with-stringr

library(emoji)

top.emoji <- tweets.raw.df %>%
  mutate(emoji = emoji_extract_all(clean.text.2)) %>%
  unnest(cols = c(emoji)) %>%
  count(emoji, sort = TRUE) %>%
  top_n(30)






#########

# TEXT ANALYSIS
# Biagram Analysis (We want to count pairwise occurences of words which appear together in the text, this is what is known as bigram count.)


bi.gram.words <- tweets.raw.df %>%
  unnest_tokens(
    input = clean.text.2,
    output = bigram,
    token = 'ngrams',
    n = 2
  ) %>% 
  filter(!is.na(bigram))


bi.gram.words %>% 
  select(bigram) %>% 
  head(10)


# We now seperate the words in bigram column and create two seperate columns.

bi.gram.words <- tidyr::separate(bi.gram.words, col = bigram, into = c('word1', 'word2'), sep = ' ')


#filter the stopwords and remove white spaces. We already remvoed the stopwords, but lets re do it again.

bi.gram.words %<>% 
  filter(! word1 %in% turkish.stopwords) %>% 
  filter(! word2 %in% turkish.stopwords) %>% 
  filter(! is.na(word1)) %>% 
  filter(! is.na(word2))


#finally, we group and count by bigram

bi.gram.count <- bi.gram.words %>% 
  count(word1, word2, sort = TRUE) %>% 
  # We rename the weight column so that the 
  # associated network gets the weights (see below).
  rename(weight = n)

bi.gram.count %>% head()





# I remowed the first 3 rows, because they were name+surnames.

bi.gram.count <- subset(bi.gram.count, weight<3500)

# Weight distribution: Let's plot the distribution of the weight values.

bi.gram.count %>% 
  ggplot(mapping = aes(x = weight)) +
  theme_light() +
  geom_histogram() +
  labs(title = "Bigram Weight Distribution")


# Note that is very skewed, for visualization purposes it might be a good idea to perform a transformation, e.g. log transform:

bi.gram.count %>% 
  mutate(weight = log(weight + 1)) %>% 
  ggplot(mapping = aes(x = weight)) +
  theme_light() +
  geom_histogram() +
  labs(title = "Bigram log-Weight Distribution")


# For visualization purposes, we can set a threshold which defines the minimal weight allowed in the graph. (In this case we allow values bigger than 20 in the graph)

threshold <- 200


# For visualization purposes we scale by a global factor. 

ScaleWeight <- function(x, lambda) {
  x / lambda
}

network <-  bi.gram.count %>%
  filter(weight > threshold) %>%
  mutate(weight = ScaleWeight(x = weight, lambda = 2E3)) %>% 
  graph_from_data_frame(directed = FALSE)


# let us verify we have a weighted network

is.weighted(network)


# Visualization

plot(
  network, 
  vertex.size = 3,
  vertex.label.color = 'black', 
  vertex.label.cex = 0.7, 
  vertex.label.dist = 1,
  edge.color = 'gray', 
  main = 'Bigram Count Network', 
  sub = glue('Weight Threshold: {threshold}'), 
  alpha = 50
)






# Add more information to the visualization. Set the size of the nodes by the degree and weight respectively

# Store the degree

V(network)$degree <- strength(graph = network)


#compute the weight shares

E(network)$width <- E(network)$weight/max(E(network)$weight)


plot(
  network,
  vertex.color = 'lightblue',
  #Scale node size by degree
  vertex.size = 2*V(network)$degree,
  vertex.label.color = 'black',
  vertex.label.cex = 0.5,
  vertex.label.dist = 0.6,
  edge.color = 'gray',
  #Set edge width proportional to the weighr relative value
  edge.width = 4*E(network)$width,
  main = 'Bigram Count Network',
  sub = glue('Weight Thresold: {threshold}'),
  alpha = 50,
)

# We can extract the biggest connected component of the network

#Get all connected components

clusters(graph = network)


# Select bigggest component

V(network)$cluster <- clusters(graph = network)$membership


cc.network <- induced.subgraph(
  graph = network,
  vids = which(V(network)$cluster == which.max(clusters(graph = network)$csize))
)


cc.network


# Compute the weight shares

E(cc.network)$width <- E(cc.network)$weight/max(E(cc.network)$weight)

plot(
  cc.network,
  vertex.color = 'lightblue',
  #Scale node size by degree
  vertex.size = 2*V(cc.network)$degree,
  vertex.label.color = 'black',
  vertex.label.cex = 0.9, # Font size (multiplication factor, device-dependent)
  vertex.label.dist = 1.6,  # Distance between the label and the vertex
  vertex.label.degree = 1.5,  # The position of the label in relation to the vertex (use pi
  edge.color = 'gray',
  #Set edge width proportional to the weight relative value
  edge.width = 3*E(cc.network)$width,
  main = 'Bigram Count Network (Biggest Connected Component)',
  sub = glue('Weiight Threshold: {threshold}'),
  alpha = 50
)


# Let's make the visualization more dynamic using the networkD3 library.



network2 <- bi.gram.count %>%
  filter(weight > threshold) %>%
  graph_from_data_frame(directed = FALSE)

#store the degree
V(network2)$degree <- strength(graph = network2)
#compute the weight shares
E(network2)$width <- E(network2)$weight/max(E(network2)$weight)


# Create networkD3 object.

networkD3 <- igraph_to_networkD3(g = network2)

#Define node size

networkD3$nodes %<>% mutate(Degree = (1E-2)*V(network2)$degree)

# Define color group 

networkD3$nodes %<>% mutate(Group = 1)

# Define edges width

networkD3$links$Width <- 10*E(network2)$width



forceNetwork(
  Links = networkD3$links,
  Nodes = networkD3$nodes,
  Source = 'source',
  Target = 'target',
  NodeID = 'name',
  Group = 'Group',
  opacity = 0.9,
  Value = 'Width',
  Nodesize = 'Degree',
  #We input a Javascript Function
  linkWidth = JS("function(d) { return Math.sqrt(d.value); }"),
  fontSize = 10,
  zoom = TRUE,
  opacityNoHover = 1
)


# Let's now decrease the threshold to get a more complex network

threshold<- 100 # rerun the code above to get the new network


###

# SKIPGRAM ANALYSIS: (skipgrams: allow a "jump" in the word count)

# it is an unsupervised learning technique used to find the most related words for a given word.



skip.window <- 2

skip.gram.words <- tweets.raw.df %>%
  unnest_tokens(
    input = clean.text.2,
    output = skipgram,
    token = 'skip_ngrams',
    n = skip.window
  ) %>%
  filter(! is.na(skipgram))


# for example, consider the tweet:

tweets.raw.df %>%
  slice(1) %>%
  pull(clean.text.2)

# the skipgrams are:

skip.gram.words %>%
  select(skipgram) %>%
  slice(10:20)


# We now count the skipgrams containing two words
library(ngram)

skip.gram.words$num_words <- skip.gram.words$skipgram %>%
  map_int(.f =  ~ ngram::wordcount(.x))


# and we select only column with 2 words and remove the numwords column 

skip.gram.words %<>% filter(num_words == 2) %>% select(- num_words)



skip.gram.words %<>%
  separate(col = skipgram, into = c('word1', 'word2'), sep = ' ') %>%
  filter(! word1 %in% turkish.stopwords) %>%
  filter(! word2 %in% turkish.stopwords) %>%
  filter(! is.na(word1)) %>%
  filter(! is.na(word2))


skip.gram.words.extracted <- subset(skip.gram.words, select = c(word1, word2))


# Replace same words

skip.gram.words.extracted<- skip.gram.words.extracted %>% 
  mutate(word1 = str_replace_all(word1, pattern = c("gültekinin" = "gültekin", "gültekini" = "gültekin", "avcının" = "avcı"))) %>%
  mutate(word2 = str_replace_all(word2, pattern = c("gültekinin" = "gültekin", "gültekini" = "gültekin", "avcının" = "avcı")))


skip.gram.words.extracted<- skip.gram.words.extracted %>% 
  mutate(word1 = str_replace_all(word1, pattern = c("cemal" = "metin"))) %>%
  mutate(word2 = str_replace_all(word2, pattern = c("metin" = "avcı")))


# Finally, we group and count by skipgram

skip.gram.count <- skip.gram.words.extracted %>%
  count(word1, word2, sort = TRUE) %>%
  #we rename the weight column so that the associated network gets the weights
  rename(weight = n)

skip.gram.count %>% head()

# Remove unrelated words from the skipgram data

skip.gram.count<- subset(skip.gram.count, word2!="deprem" & word2!="ronaldo" & word2!="copaamericafina" & word2!="piknigeyasak" & word2!="haitti" & word2!="misiniz" & word2!="in" &
                           word2!="ın"& word2!="li"& word2!="dgs" & word2!="arveles" & word2!="i" & word2!="mi" &word2!="nci")






# I remowed the first 3 rows, because they were name+surnames.

skip.gram.count <- subset(skip.gram.count, weight<3500)

## Visualization

#threshold

threshold <- 100

network3 <- skip.gram.count %>%
  filter(weight > threshold) %>%
  graph_from_data_frame(directed = FALSE)


# select the biggest connected component

V(network3)$cluster <- clusters(graph = network3)$membership

cc.network.2 <- induced_subgraph(
  graph = network3,
  vids = which(V(network3)$cluster == which.max(clusters(graph = network3)$csize))
)


#Store the degree
V(cc.network.2)$degree <- strength(graph = cc.network.2)
#Compute the weight shares
E(cc.network.2)$width <- E(cc.network.2)$weight/max(E(cc.network.2)$weight)

#Create a networkD3 object

networkD3.2 <- igraph_to_networkD3(g = cc.network.2)

# Define node size.
networkD3.2$nodes %<>% mutate(Degree = (1E-2)*V(cc.network.2)$degree)
# Degine color group (I will explore this feature later).
networkD3.2$nodes %<>% mutate(Group = 1)
# Define edges width. 
networkD3.2$links$Width <- 10*E(cc.network.2)$width


forceNetwork(
  Links = networkD3.2$links, 
  Nodes = networkD3.2$nodes, 
  Source = 'source', 
  Target = 'target',
  NodeID = 'name',
  Group = 'Group', 
  opacity = 0.9,
  Value = 'Width',
  Nodesize = 'Degree', 
  # We input a JavaScript function.
  linkWidth = JS("function(d) { return Math.sqrt(d.value); }"), 
  fontSize = 12,
  zoom = TRUE, 
  opacityNoHover = 1
)


# Node importance

# Compute the centrality measures for the biggest connected component from above.

node.impo.df <- tibble(
  word = V(cc.network.2)$name,  
  degree = strength(graph = cc.network.2),
  closeness = closeness(graph = cc.network.2), 
  betweenness = betweenness(graph = cc.network.2)
)

# now we rank the nodes with respect to these centrality measures

#degree centrality  (It returns how many edges each node has.)

node.impo.df %>%
  arrange(- degree) %>%
  head(10)


#closeness centrality (https://bookdown.org/markhoff/social_network_analysis/centrality.html)

node.impo.df %>%
  arrange(- closeness) %>%
  head(10)



# betweenness centrality (Counts how many shortest paths each node is on. The higher a node’s betweenness, the more important they are for the efficient flow of goods in a network)

node.impo.df %>%
  arrange(- betweenness) %>%
  head(10)



#Let's see the distribution of these centrality measures

plt.deg <- node.impo.df %>%
  ggplot(mapping = aes(x = degree)) +
  theme_light() +
  geom_histogram(fill = 'blue', alpha = 0.8, bins = 30)


plt.clo <- node.impo.df %>%
  ggplot(mapping = aes(x = closeness)) +
  theme_light() +
  geom_histogram(fill = 'red', alpha = 0.8, bins = 30)

plt.bet <- node.impo.df %>%
  ggplot(mapping = aes(x = betweenness)) +
  theme_light() +
  geom_histogram(fill = 'green4', alpha = 0.8, bins = 30)



plot_grid(
  ... = plt.deg,
  plt.clo,
  plt.bet,
  ncol = 1,
  align = 'v'
)


###

# Community Detection

comm.det.obj <- cluster_louvain(
  graph = cc.network.2,
  weights = E(cc.network.2)$weight
)

comm.det.obj # We see that: IGRAPH clustering multi level, groups: 9, mod: 0.57


# Now we encode the membership as a node attribute ( zoom and click on each node to explore the clusters

V(cc.network.2)$membership <- membership(comm.det.obj)

# We use the membership label to color the nodes

networkD3.2$nodes$Group <- V(cc.network.2)$membership


skipgram.network <- forceNetwork(
  Links = networkD3.2$links, 
  Nodes = networkD3.2$nodes, 
  Source = 'source', 
  Target = 'target',
  NodeID = 'name',
  Group = 'Group', 
  opacity = 0.9,
  Value = 'Width',
  Nodesize = 'Degree', 
  # We input a JavaScript function.
  linkWidth = JS("function(d) { return Math.sqrt(d.value); }"), 
  fontSize = 12,
  zoom = TRUE, 
  opacityNoHover = 1
)

skipgram.network


saveNetwork(skipgram.network, file = "skipgram.html", selfcontained = FALSE)

# Let's collect the words per cluster

membership.df <- tibble(
  word = V(cc.network.2) %>% names(),
  cluster = V(cc.network.2)$membership
)


V(cc.network.2)$membership %>%
  unique %>% 
  sort %>% 
  map_chr(.f = function(cluster.id) {
    
    membership.df %>% 
      filter(cluster == cluster.id) %>% 
      # Get 15 at most 15 words per cluster.
      slice(1:15) %>% 
      pull(word) %>% 
      str_c(collapse = ', ')
    
  }) 

# Sunum icin 18. cluster i sildim. Bskipgram datasini sonra tekrar temizleyecegim, buna gerek kalmayacak.
skipgram.clusters <- V(cc.network.2)$membership %>% 
  unique %>% 
  sort %>% 
  map_chr(.f = function(cluster.id) {
    
    membership.df %>% 
      filter(cluster == cluster.id) %>% 
      filter(cluster < 18) %>%
      # Get 15 at most 15 words per cluster.
      slice(1:15) %>% 
      pull(word) %>% 
      str_c(collapse = ', ')
    
  }) 

skipgram.clusters

# Saved  all global environment data for Rmarkdown html output (https://stackoverflow.com/questions/34029611/how-to-use-objects-from-global-environment-in-rstudio-markdown)

save.image("all.data.RData")






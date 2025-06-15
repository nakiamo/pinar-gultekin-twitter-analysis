# 02_prepare_data.R
# Purpose: Prepare and clean data for social network analysis

# Load required libraries
library(tidyverse)
library(lubridate)
library(rtweet)
library(janitor)

#deleted previous steps because we already have the dataframes in the data/processed folder

# 6. Save processed data
# Create processed data directory if it doesn't exist
dir.create("data/processed", showWarnings = FALSE, recursive = TRUE)

# Save processed dataframes
saveRDS(joined.clean, "data/processed/joined_clean.rds")
saveRDS(retweet_df, "data/processed/retweet_df.rds")
saveRDS(quoted_df, "data/processed/quoted_df.rds")
saveRDS(mentions_df, "data/processed/mentions_df.rds")

# 7. Print summary of processed data
cat("\nData Preparation Summary:\n")
cat("------------------------\n")

if (exists("joined.clean")) {
  cat("\nMain dataset (joined.clean):\n")
  cat("- Rows:", nrow(joined.clean), "\n")
  cat("- Columns:", ncol(joined.clean), "\n")
}

if (exists("retweet_df")) {
  cat("\nRetweet network:\n")
  cat("- Number of retweets:", nrow(retweet_df), "\n")
  cat("- Unique users:", n_distinct(c(retweet_df$user_username, retweet_df$screen_name)), "\n")
}

if (exists("quoted_df")) {
  cat("\nQuote network:\n")
  cat("- Number of quotes:", nrow(quoted_df), "\n")
  cat("- Unique users:", n_distinct(c(quoted_df$user_username, quoted_df$screen_name)), "\n")
}

if (exists("mentions_df")) {
  cat("\nMentions network:\n")
  cat("- Number of mentions:", nrow(mentions_df), "\n")
  cat("- Unique users:", n_distinct(c(mentions_df$user_username, mentions_df$mention_username)), "\n")
}

cat("\nProcessed data saved to data/processed/\n") 
# Load required packages
library(tidyverse)
library(lubridate)
library(scales)
library(ggplot2)

# Load the processed data
load("data/processed/processed_data.RData")

# Ensure pinargultekin data is properly formatted
pinargultekin <- pinargultekin %>%
  mutate(tarih = as.POSIXct(tarih, tz = "UTC"))

# Create time series plots for different time periods
# 1. First 48 hours
start_datetime <- as.POSIXct("2020-07-19 13:00:00", tz = "UTC")
end_datetime <- start_datetime + hours(48)

pinargultekin_48h <- pinargultekin %>%
  filter(tarih >= start_datetime & tarih < end_datetime)

p_hourly_48h <- ggplot(pinargultekin_48h, aes(x = tarih, y = tweet_sayisi)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  labs(title = "Hourly Tweet Frequency (First 48 Hours)",
       x = "Date and Hour", y = "Number of Tweets") +
  scale_x_datetime(date_breaks = "6 hours", date_labels = "%b %d %H:%M") +
  scale_y_continuous(labels = label_comma()) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save the plot
ggsave("output/time_series_hourly_first48h.png", p_hourly_48h, width = 12, height = 6)

# 2. Daily aggregation
daily <- pinargultekin %>%
  mutate(date = as.Date(tarih)) %>%
  group_by(date) %>%
  summarise(tweet_sayisi = sum(tweet_sayisi), .groups = "drop")

p_daily <- ggplot(daily, aes(x = date, y = tweet_sayisi)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  labs(title = "Daily Tweet Frequency",
       x = "Date", y = "Number of Tweets") +
  scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
  scale_y_continuous(labels = label_comma()) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save the plot
ggsave("output/time_series_daily.png", p_daily, width = 12, height = 6)

# 3. Weekly aggregation
weekly <- daily %>%
  mutate(week = floor_date(date, "week")) %>%
  group_by(week) %>%
  summarise(tweet_sayisi = sum(tweet_sayisi), .groups = "drop")

p_weekly <- ggplot(weekly, aes(x = week, y = tweet_sayisi)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  labs(title = "Weekly Tweet Frequency",
       x = "Week", y = "Number of Tweets") +
  scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
  scale_y_continuous(labels = label_comma()) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save the plot
ggsave("output/time_series_weekly.png", p_weekly, width = 12, height = 6)

# 4. Monthly aggregation
monthly <- daily %>%
  mutate(month = floor_date(date, "month")) %>%
  group_by(month) %>%
  summarise(tweet_sayisi = sum(tweet_sayisi), .groups = "drop")

p_monthly <- ggplot(monthly, aes(x = month, y = tweet_sayisi)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  labs(title = "Monthly Tweet Frequency",
       x = "Month", y = "Number of Tweets") +
  scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
  scale_y_continuous(labels = label_comma()) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save the plot
ggsave("output/time_series_monthly.png", p_monthly, width = 12, height = 6)

# Save the aggregated data
save(daily, weekly, monthly, file = "data/processed/time_series_data.RData") 
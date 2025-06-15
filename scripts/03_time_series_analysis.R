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



# 03_time_series_analysis.R
# Purpose: Time series analysis of tweet frequency from the original pinargultekin dataframe (already hourly aggregated)

# Load required libraries
library(tidyverse)
library(lubridate)
library(ggplot2)
library(scales)

# Check if pinargultekin exists and create it if needed
if (!exists("pinargultekin")) {
  # Create pinargultekin dataframe from joined.clean with hourly information
  pinargultekin <- joined.clean %>%
    mutate(
      tarih = as.Date(created_at),
      saat = hour(created_at),
      tarih_saat = floor_date(created_at, "hour")
    ) %>%
    group_by(tarih, saat, tarih_saat) %>%
    summarise(tweet_sayisi = n(), .groups = "drop") %>%
    arrange(tarih_saat)
} else {
  # Ensure date and time columns are in correct format
  pinargultekin <- pinargultekin %>%
    mutate(
      tarih = as.Date(tarih),
      saat = hour(created_at),
      tarih_saat = floor_date(created_at, "hour")
    )
}

# Print the structure of pinargultekin to verify date format
cat("\nStructure of pinargultekin dataframe:\n")
str(pinargultekin)

# 1. Ensure 'tarih' is POSIXct
pinargultekin <- pinargultekin %>%
  mutate(tarih = as.POSIXct(tarih, tz = "UTC"))  # Adjust tz if needed


# 2. Plot Hourly Tweet Frequency for the First Week (168 hours) from a Specific Start
start_datetime <- as.POSIXct("2020-07-19 13:00:00", tz = "UTC")
end_datetime <- start_datetime + hours(168)  # 7 days * 24 hours
pinargultekin_168h <- pinargultekin %>%
  filter(tarih >= start_datetime & tarih < end_datetime)

p_hourly_168h <- ggplot(pinargultekin_168h, aes(x = tarih, y = tweet_sayisi)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  labs(
    title = "Hourly Tweet Frequency (First 2 Weeks)",
    x = "Date and Hour",
    y = "Number of Tweets"
  ) +
  scale_x_datetime(date_breaks = "6 hours", date_labels = "%b %d %H:%M") +
  scale_y_continuous(labels = label_comma()) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("output/time_series_hourly_first168h.png", p_hourly_168h, width = 12, height = 6)



# 3. Aggregate to Daily, Weekly, and Monthly
daily <- pinargultekin %>%
  mutate(date = as.Date(tarih)) %>%
  group_by(date) %>%
  summarise(tweet_sayisi = sum(tweet_sayisi), .groups = "drop")

weekly <- daily %>%
  mutate(week = floor_date(date, "week")) %>%
  group_by(week) %>%
  summarise(tweet_sayisi = sum(tweet_sayisi), .groups = "drop")

monthly <- daily %>%
  mutate(month = floor_date(date, "month")) %>%
  group_by(month) %>%
  summarise(tweet_sayisi = sum(tweet_sayisi), .groups = "drop")

# 4. Plot Daily, Weekly, and Monthly Trends
p_daily <- ggplot(daily, aes(x = date, y = tweet_sayisi)) +
  geom_line() + geom_point() + theme_minimal() +
  labs(title = "Daily Tweet Frequency", x = "Date", y = "Number of Tweets") +
  scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("output/time_series_daily.png", p_daily, width = 12, height = 6)

# Weekly
p_weekly <- ggplot(weekly, aes(x = week, y = tweet_sayisi)) +
  geom_line() + geom_point() + theme_minimal() +
  labs(title = "Weekly Tweet Frequency", x = "Week", y = "Number of Tweets") +
  scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
  scale_y_continuous(labels = label_comma()) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("output/time_series_weekly.png", p_weekly, width = 12, height = 6)

# Monthly
p_monthly <- ggplot(monthly, aes(x = month, y = tweet_sayisi)) +
  geom_line() + geom_point() + theme_minimal() +
  labs(title = "Monthly Tweet Frequency", x = "Month", y = "Number of Tweets") +
  scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
  scale_y_continuous(labels = label_comma()) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggsave("output/time_series_monthly.png", p_monthly, width = 12, height = 6)




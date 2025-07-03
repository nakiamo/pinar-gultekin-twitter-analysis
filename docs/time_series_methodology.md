# Time Series Analysis Methodology

## Overview

This document details the methodological approach used to analyze temporal patterns in Twitter interactions surrounding the Pınar Gültekin case. The analysis focuses on understanding tweet frequency patterns across different time scales and identifying key temporal characteristics of the discourse.

## Data Preparation

### 1. Time-based Aggregation
- **Hourly Aggregation**
  - Created from raw tweet timestamps
  - Uses `floor_date()` for consistent hourly bins
  - Includes date, hour, and combined datetime fields

### 2. Data Structure
```R
pinargultekin <- joined.clean %>%
  mutate(
    tarih = as.Date(created_at),
    saat = hour(created_at),
    tarih_saat = floor_date(created_at, "hour")
  ) %>%
  group_by(tarih, saat, tarih_saat) %>%
  summarise(tweet_sayisi = n(), .groups = "drop")
```

## Analysis Components

### 1. Multi-scale Temporal Analysis
- **Hourly Analysis**
  - Detailed view of first week (168 hours)
  - Captures immediate response patterns
  - Reveals daily activity cycles

- **Daily Aggregation**
  ```R
  daily <- pinargultekin %>%
    mutate(date = as.Date(tarih)) %>%
    group_by(date) %>%
    summarise(tweet_sayisi = sum(tweet_sayisi))
  ```

- **Weekly Aggregation**
  ```R
  weekly <- daily %>%
    mutate(week = floor_date(date, "week")) %>%
    group_by(week) %>%
    summarise(tweet_sayisi = sum(tweet_sayisi))
  ```

- **Monthly Aggregation**
  ```R
  monthly <- daily %>%
    mutate(month = floor_date(date, "month")) %>%
    group_by(month) %>%
    summarise(tweet_sayisi = sum(tweet_sayisi))
  ```

### 2. Visualization Approaches

#### Hourly Visualization
- Line plot with points for first 168 hours
- 6-hour interval markers
- Datetime formatting: "%b %d %H:%M"
- Y-axis with comma formatting for readability

```R
ggplot(pinargultekin_168h, aes(x = tarih, y = tweet_sayisi)) +
  geom_line() +
  geom_point() +
  scale_x_datetime(date_breaks = "6 hours", date_labels = "%b %d %H:%M") +
  scale_y_continuous(labels = label_comma())
```

#### Daily/Weekly/Monthly Visualizations
- Consistent visualization approach across time scales
- Line plots with points for trend visibility
- Monthly x-axis breaks for context
- Comma-formatted y-axis for readability
- 45-degree rotated x-axis labels

```R
ggplot(data, aes(x = time_variable, y = tweet_sayisi)) +
  geom_line() + 
  geom_point() + 
  theme_minimal() +
  scale_x_date(date_breaks = "1 month", date_labels = "%b %Y") +
  scale_y_continuous(labels = label_comma()) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

## Implementation Details

### Software Stack
- R programming language
- Key packages:
  * `tidyverse`: Data manipulation
  * `lubridate`: Time series handling
  * `ggplot2`: Visualization
  * `scales`: Axis formatting

### Output Files
1. `time_series_hourly_first168h.png`: Initial response pattern
2. `time_series_daily.png`: Daily tweet frequency
3. `time_series_weekly.png`: Weekly aggregated patterns
4. `time_series_monthly.png`: Monthly trends

## Analysis Interpretation

### 1. Temporal Patterns
- Initial response intensity (first 168 hours)
- Daily activity cycles
- Weekly patterns and weekend effects
- Monthly trend and long-term engagement

### 2. Event Detection
- Spike identification in hourly data
- Sustained high-activity periods
- Pattern changes across time scales

### 3. Engagement Patterns
- Short-term response characteristics
- Medium-term sustainability
- Long-term trend analysis

## Limitations and Considerations

### 1. Time Zone Considerations
- UTC standardization
- Local time effects on patterns
- Temporal alignment of events

### 2. Aggregation Effects
- Information loss in coarser time scales
- Balance between detail and pattern visibility
- Choice of aggregation periods

### 3. Missing Data Handling
- Gaps in time series
- Edge effects in aggregation
- Completeness of temporal coverage

## Future Extensions

1. **Advanced Time Series Analysis**
   - Seasonal decomposition
   - Trend analysis
   - Pattern detection algorithms

2. **Integration with Other Analyses**
   - Correlation with network metrics
   - Content analysis timing
   - Sentiment evolution

3. **Event-Based Analysis**
   - Key event identification
   - Response pattern characterization
   - Cross-event comparison

## References

[To be added: Key methodological papers and relevant literature] 
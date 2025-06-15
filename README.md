# Twitter (X) Social Network Analysis: The #PınarGültekin Case

This repository contains analyses of Twitter data related to the femicide case of Pınar Gültekin in Türkiye. The project applies social network analysis, time series analysis, and content analysis to examine the dynamics of online conversations, public engagement, and political polarization surrounding the case.

## Project Structure

```
.
├── data/
│   ├── raw/          # Original, immutable data
│   └── processed/    # Cleaned and processed data
├── docs/             # Documentation and analysis notes
├── output/           # Generated outputs and visualizations
└── scripts/          # Analysis scripts
```

## Data

The analysis uses Twitter data collected between 2020-2023. The raw data is stored in `data/raw/all.data.RData`. Due to Twitter's terms of service and privacy concerns, the raw data is not included in this repository. However, processed data and analysis results are available.

## Analysis

The project includes several types of analysis:

1. Time Series Analysis
   - Hourly, daily, weekly, and monthly tweet frequencies
   - Event detection and trend analysis

2. Network Analysis
   - Retweet and quote networks
   - User influence and community detection
   - Network visualization

3. Content Analysis
   - Topic modeling
   - Sentiment analysis
   - Key themes and discussions

## Getting Started

1. Clone the repository:
```bash
git clone https://github.com/yourusername/twitter-sna-analysis.git
```

2. Install required R packages:
```R
install.packages(c("tidyverse", "lubridate", "igraph", "tidytext", "quanteda"))
```

3. Run the analysis scripts in order:
   - `01_load_and_document.R`: Load and document the data
   - `02_time_series_analysis.R`: Time series analysis
   - Additional analysis scripts as needed

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Data collection and initial processing: [Naim Cinar/Anadolu University; Berna Gorgulu/University of Pittsburgh]
- Analysis tools: R, tidyverse, igraph, and other open-source packages



[https://www.naimcinar.com] 
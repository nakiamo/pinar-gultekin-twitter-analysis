# Text Analysis Methodology: Pınar Gültekin Twitter Discourse

## Overview
This document describes the methodology for text analysis of tweets related to the Pınar Gültekin case. The focus is on extracting, cleaning, and analyzing hashtags to understand the main themes and their interconnections in the discourse.

## Data Preparation
- Used preprocessed data (`tweets.raw.df` and `words.df`) saved from the main cleaning pipeline.
- Ensured all text is normalized, cleaned, and tokenized.

## Hashtag Analysis Steps
1. **Extraction & Cleaning**
   - Extract hashtags from each tweet, convert to lowercase, and split multiple hashtags.
   - Remove empty or NA values.
2. **Frequency Analysis**
   - Count the frequency of each hashtag.
   - Visualize the top hashtags to identify dominant themes.
3. **Co-occurrence Analysis**
   - Identify pairs of hashtags that appear together in the same tweet.
   - Count and rank co-occurring pairs.
   - Visualize the co-occurrence network to reveal thematic connections.

## Visualization
- Bar chart of top 20 hashtags (saved as `output/top20_hashtags.png`).
- Network graph of top 40 hashtag co-occurrences (saved as `output/hashtag_cooccurrence_network.png`).

## Rationale
- Hashtags are key indicators of topics, campaigns, and communities on Twitter.
- Co-occurrence analysis reveals how themes are linked and which topics bridge different parts of the discourse.

## Next Steps
- Topic modeling to uncover latent themes.
- Discourse analysis by user group or over time.
- Integration with network/community structure for deeper insights.

## Planned Analysis Components

### 1. Text Preprocessing
- Cleaning and normalization
- Turkish language considerations
- Tokenization strategies
- Stop word handling

### 2. Topic Modeling
- LDA approach
- Topic interpretation
- Temporal topic evolution
- Cross-community topic comparison

### 3. Discourse Analysis
- Key phrase extraction
- Narrative identification
- Framing analysis
- Argument structure

### 4. Linguistic Analysis
- Language style analysis
- Emotional content
- Rhetorical strategies
- Cross-group language differences

### 5. Hashtag Analysis
- Co-occurrence patterns
- Temporal evolution
- Community-specific usage
- Campaign identification

## Implementation

[TO BE DEVELOPED]

## References

[TO BE ADDED] 
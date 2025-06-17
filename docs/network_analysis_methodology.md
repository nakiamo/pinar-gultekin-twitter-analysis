# Network Analysis Methodology: Political Polarization in Social Media

## Overview

This document details the methodological approach used to analyze political polarization in Twitter interactions surrounding the Pınar Gültekin case. The analysis employs social network analysis (SNA) techniques to examine different types of social media interactions and their role in political discourse and polarization.

## Data Structure

### Network Components
- **Nodes**: Individual Twitter users
- **Edges**: Interactions between users (directed)
- **Edge Types**:
  - Retweets: Information amplification
  - Quotes: Commentary and critique
  - Replies: Direct conversations
  - Mentions: Indirect references

## Analysis Framework

### 1. Multi-layered Network Analysis

We analyze political polarization through four distinct interaction networks and one composite network:

#### a) Retweet Network
- **Purpose**: Measure information propagation and endorsement patterns
- **Significance**: Retweets typically indicate agreement or amplification
- **Key Metrics**:
  - In-degree: Measures message reach and user influence
  - Core numbers: Identifies key information distributors
  - Community structure: Reveals echo chambers

#### b) Quote Network
- **Purpose**: Analyze commentary and critique patterns
- **Significance**: Quotes can represent both support and opposition
- **Key Metrics**:
  - Quote-to-quoted ratio: Balance of receiving vs. giving commentary
  - Sentiment analysis of quotes (if applicable)
  - Cross-community quoting patterns

#### c) Reply Network
- **Purpose**: Examine direct discourse patterns
- **Significance**: Shows actual conversation and debate
- **Key Metrics**:
  - Reciprocity: Measures mutual engagement
  - Reply patterns: Identifies discussion clusters
  - Cross-ideological conversations

#### d) Mentions Network
- **Purpose**: Analyze indirect references and discussions
- **Significance**: Shows attention patterns and discourse framing
- **Key Metrics**:
  - Mention patterns: Who gets talked about
  - Mention contexts: How users are referenced
  - Cross-community mention patterns

#### e) Composite Network
- **Purpose**: Understand overall communication structure
- **Significance**: Provides holistic view of polarization
- **Integration**: Combines all interaction types with appropriate weights

### 2. Network Metrics and Their Interpretation

#### Basic Network Metrics
1. **Network Density**
   - Definition: Proportion of possible connections that exist
   - Interpretation: Higher density suggests more active discourse
   - Political relevance: Can indicate echo chamber formation

2. **Reciprocity**
   - Definition: Proportion of mutual interactions
   - Interpretation: Higher values suggest genuine dialogue
   - Political relevance: Low reciprocity may indicate polarized discourse

#### Structural Metrics

3. **Clustering Coefficient**
   - Global clustering: Overall tendency to form tight-knit groups
   - Local clustering: Individual user's neighborhood cohesion
   - Political relevance: High clustering can indicate echo chambers
   - Interpretation framework:
     - Values close to 1: Strong echo chamber effects
     - Values close to 0: More diverse interactions

4. **Assortativity**
   - Definition: Tendency of users to connect to similar others
   - Measurement: Based on node degree correlation
   - Political relevance: 
     - Positive values: Users interact within their groups
     - Negative values: Cross-group interactions

5. **Core-Periphery Structure**
   - Purpose: Identify network hierarchy
   - Components:
     - Core: Highly connected users
     - Periphery: Less connected users
   - Political relevance: Power distribution in discourse

#### Centrality Measures

6. **In-degree Centrality**
   - Definition: Number of incoming interactions
   - Interpretation: User visibility and influence
   - Political relevance: Identifies opinion leaders
   - Calculation: `degree(graph, mode="in")`
   - Significance: Most straightforward measure of content spread

7. **Out-degree Centrality**
   - Definition: Number of outgoing interactions
   - Interpretation: User engagement and activity
   - Political relevance: Identifies active participants
   - Calculation: `degree(graph, mode="out")`

8. **Betweenness Centrality**
   - Definition: Role in connecting different parts of network
   - Interpretation: Bridge users between communities
   - Political relevance: Potential mediators between groups
   - Calculation: `betweenness(graph)`
   - Significance: Identifies users facilitating cross-group information flow

9. **Eigenvector Centrality**
   - Definition: Influence considering connections' influence
   - Interpretation: Overall importance in network
   - Political relevance: Key players in information flow
   - Calculation: `eigen_centrality(graph)$vector`
   - Significance: Identifies users central to core discussions

### 3. Composite Influence Score

For analyses requiring a single measure of influence, we combine multiple centrality measures:

#### Components and Weights
1. **In-degree Centrality (40%)**
   - Direct influence through received interactions
   - Weighted more heavily as it represents actual engagement

2. **Betweenness Centrality (30%)**
   - Role in information flow
   - Bridge users between communities

3. **Eigenvector Centrality (30%)**
   - Global influence considering network structure
   - Connection to other influential users

#### Score Calculation
```R
# Normalization function
normalize <- function(x) (x - min(x)) / (max(x) - min(x))

# Composite score calculation
influence_score <- (
  normalize(in_degree) * 0.4 +
  normalize(betweenness_cent) * 0.3 +
  normalize(eigen_cent) * 0.3
)
```

#### Minimum Activity Thresholds
To ensure meaningful influence scores:
- Above-average in-degree OR
- Non-zero betweenness centrality

### 4. Community Detection and Polarization Analysis

#### Community Detection
- **Method**: Louvain algorithm with resolution parameter adjustment
- **Purpose**: Identify distinct political groups
- **Validation**: Compare with known political affiliations

#### Polarization Metrics
1. **Between-group Density**
   - Measures interaction levels between communities
   - Lower values indicate stronger polarization

2. **Modularity**
   - Measures strength of community division
   - Higher values indicate stronger polarization

3. **Echo Chamber Effects**
   - Within-group vs. between-group interaction ratios
   - Information flow patterns within communities

### 5. Temporal Analysis

#### Dynamic Network Analysis
- Track changes in network structure over time
- Identify key events and their impact
- Monitor evolution of polarization

#### Event-Based Analysis
- Before/after comparisons of key events
- Changes in interaction patterns
- Shifts in community structure

## Visualization Approaches

### 1. Network Visualizations
- Force-directed layouts for community structure
- Node size: Proportional to centrality measures
- Edge weight: Interaction frequency
- Color coding: Communities and interaction types

### 2. Metric Visualizations
- Time series of key metrics
- Community interaction heatmaps
- Centrality distribution plots
- Distribution metrics:
  * Mean and median values
  * Users with >100 interactions
  * Users with >1000 interactions

## Implementation Details

### Software Stack
- R programming language
- Key packages:
  * `igraph`: Network analysis
  * `tidyverse`: Data manipulation
  * Additional visualization packages as needed

### Code Organization
- Separate scripts for each network type
- Modular functions for reusability
- Clear documentation and comments
- Progress indicators for long-running operations

## Limitations and Considerations

### 1. Data Limitations
- Twitter API restrictions
- Sampling considerations
- Missing data handling

### 2. Methodological Limitations
- Community detection algorithm limitations
- Temporal resolution constraints
- Causality inference limitations

### 3. Interpretation Challenges
- Context dependency
- Multiple interaction interpretations
- Bot activity considerations

## Future Research Directions

1. **Integration with Content Analysis**
   - Combining network structure with text analysis
   - Sentiment analysis integration
   - Topic modeling applications

2. **Comparative Analysis**
   - Cross-case comparisons
   - Cross-platform analysis
   - Temporal pattern analysis

3. **Methodological Extensions**
   - Multi-layer network analysis
   - Dynamic community detection
   - Machine learning integration

## References

[To be added: Key methodological papers and relevant literature]

# Network Analysis Methodology: Centrality Priorities by Network Type

## Overview

This document outlines the methodological decisions regarding which centrality measures to prioritize for each type of Twitter interaction network in our analysis of the Pınar Gültekin case. Different types of interactions serve different social functions, requiring distinct analytical approaches.

## Centrality Measure Priorities by Network Type

### 1. Retweet Network
Primary focus on message amplification and reach.

#### Priority Measures:
1. **In-degree Centrality**
   - Primary measure of message reach
   - Indicates content amplification success
   - Shows opinion leadership

2. **Eigenvector Centrality**
   - Secondary measure
   - Shows influence through network position
   - Captures cascade effects of information spread

3. **Supporting Measures**:
   - Core numbers (network embeddedness)
   - Betweenness centrality (less critical, mainly for temporal bridges)

#### Rationale:
- Retweets primarily represent endorsement/amplification
- One-way information flow is expected
- Focus on identifying key information sources

### 2. Quote Network
Focus on discourse and commentary.

#### Priority Measures:
1. **Dual Degree Analysis**
   - In-degree (being quoted)
   - Out-degree (quoting others)
   - Quote-to-quoted ratio

2. **Betweenness Centrality**
   - Critical for identifying discourse bridges
   - Shows who connects different narratives

3. **Eigenvector Centrality**
   - Overall influence in discourse
   - Network position importance

#### Rationale:
- Quotes represent active engagement with content
- Important for tracking narrative development
- Bridges between different viewpoints

### 3. Reply Network
Focus on direct conversations and engagement.

#### Priority Measures:
1. **Reciprocity**
   - Primary measure of genuine dialogue
   - Conversation patterns

2. **Betweenness Centrality**
   - Identifies conversation facilitators
   - Shows cross-group dialogue

3. **In/Out Degree Ratio**
   - Conversation initiation vs. response
   - Engagement patterns

#### Rationale:
- Replies indicate direct engagement
- Two-way communication is key
- Focus on dialogue quality

### 4. Mentions Network
Focus on public discussion and attention.

#### Priority Measures:
1. **Dual Analysis**
   - In-degree (being mentioned)
   - Betweenness (bridging discussions)

2. **Out-degree**
   - Active discussion participation
   - Mention patterns

3. **Mention-to-Mentioned Ratio**
   - Balance of discussion participation
   - Attention patterns

#### Rationale:
- Mentions show public attention
- Important for understanding discussion networks
- Captures indirect interactions

## Composite Analysis Considerations

### Whole Network Analysis
When analyzing the combined network:

1. **Weight Different Interactions**
   - Retweets: Information spread
   - Quotes: Discourse development
   - Replies: Direct engagement
   - Mentions: Public attention

2. **Consider Multiple Centrality Measures**
   - Use composite influence scores
   - Account for different interaction types
   - Balance various centrality measures

### Temporal Aspects

Consider how different interaction types evolve:
- Retweets: Rapid information spread
- Quotes: Narrative development
- Replies: Sustained engagement
- Mentions: Attention patterns

## Implementation Notes

1. **Data Processing**
   - Keep interaction types separate initially
   - Analyze each according to its priorities
   - Combine for holistic analysis

2. **Visualization**
   - Highlight relevant metrics for each network
   - Use appropriate layouts for different interactions
   - Consider temporal aspects

3. **Interpretation**
   - Context-specific interpretation
   - Consider interaction type characteristics
   - Account for platform limitations

## Future Considerations

1. **Metric Refinement**
   - Develop composite metrics
   - Adjust weights based on findings
   - Consider new platform features

2. **Analysis Evolution**
   - Update priorities as needed
   - Incorporate new methods
   - Adapt to changing platform dynamics 
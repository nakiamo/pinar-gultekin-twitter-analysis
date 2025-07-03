# POLITICAL NETWORK ANALYSIS
# This script analyzes political polarization in different types of Twitter interactions
# around the Pınar Gültekin case

# Load required packages
library(igraph)
library(tidyverse)
library(ggplot2)

# Step 1: Network Analysis Function with Type-Specific Metrics
# --------------------------------------------------------
analyze_network <- function(graph, network_type) {
  cat(paste("\nAnalyzing", network_type, "network:"))
  cat("\n----------------------------------------")
  
  # Basic network metrics
  # --------------------
  # Number of users in the network
  n_nodes <- vcount(graph)
  # Number of interactions between users
  n_edges <- ecount(graph)
  # Proportion of possible connections that actually exist (0-1)
  # Higher density might indicate more active discussion
  density <- edge_density(graph)
  # Proportion of mutual interactions (0-1)
  # Higher reciprocity suggests more two-way communication
  reciprocity <- reciprocity(graph)
  
  # Additional structural metrics
  # ---------------------------
  # Global clustering coefficient: Measures overall tendency to form tight-knit groups
  # Higher values (closer to 1) suggest presence of echo chambers
  clustering_coef <- transitivity(graph, type="global")
  
  # Average clustering: Mean of all users' local clustering coefficients
  # Shows typical user's embeddedness in their local network
  avg_clustering <- transitivity(graph, type="average")
  
  # Degree assortativity: Tendency of users to connect to others with similar degree (-1 to 1)
  # Positive values suggest users connect to others with similar activity levels
  # In political networks, high assortativity might indicate polarization
  assortativity_deg <- assortativity_degree(graph, directed=TRUE)
  
  # Core-periphery analysis
  # ----------------------
  # Core numbers: Measure how deeply embedded each user is in the network
  # Higher numbers indicate users in more densely connected parts of the network
  core_numbers <- coreness(graph)
  # Maximum core number indicates the depth of the network's most dense part
  n_core <- max(core_numbers)
  # Distribution of users across different core levels
  # Shows how hierarchical the network is
  core_sizes <- table(core_numbers)
  
  # Centrality measures
  # ------------------
  # In-degree: Number of incoming interactions (being retweeted, quoted, etc.)
  # Direct measure of user visibility/popularity
  in_degree <- degree(graph, mode="in")
  
  # Out-degree: Number of outgoing interactions (retweeting, quoting others, etc.)
  # Measures user activity/engagement
  out_degree <- degree(graph, mode="out")
  
  # Betweenness centrality: Measures user's role in connecting different parts of the network
  # High betweenness might indicate bridge users between political groups
  betweenness_cent <- betweenness(graph)
  
  # Eigenvector centrality: Measures user's influence considering the influence of their connections
  # High values indicate users central to the core discussions
  eigen_cent <- eigen_centrality(graph)$vector
  
  # Network-type specific analysis
  network_specific <- switch(network_type,
    "retweet" = {
      # Retweets represent endorsement/amplification of messages
      list(
        main_metric = "Times Retweeted",
        top_users = data.frame(
          user = V(graph)$name,
          count = in_degree,
          core_number = core_numbers
        ) %>% arrange(desc(count)) %>% head(20)
      )
    },
    "quote" = {
      # Quotes can represent commentary, criticism, or endorsement
      list(
        main_metric = "Times Quoted",
        top_users = data.frame(
          user = V(graph)$name,
          quoted_count = in_degree,
          quoting_count = out_degree,
          core_number = core_numbers
        ) %>% arrange(desc(quoted_count)) %>% head(20)
      )
    },
    "reply" = {
      # Replies represent direct engagement/discussion
      # Calculate user-level reciprocity (proportion of mutual interactions)
      user_reciprocity <- sapply(V(graph), function(v) {
        neighbors_in <- neighbors(graph, v, mode="in")
        neighbors_out <- neighbors(graph, v, mode="out")
        length(intersect(neighbors_in, neighbors_out)) / 
          length(union(neighbors_in, neighbors_out))
      })
      
      # Local clustering shows how interconnected each user's neighborhood is
      local_clustering <- transitivity(graph, type="local")
      
      list(
        main_metric = "Conversation Engagement",
        top_users = data.frame(
          user = V(graph)$name,
          replies_received = in_degree,
          replies_sent = out_degree,
          reciprocity = user_reciprocity,
          local_clustering = local_clustering,
          core_number = core_numbers
        ) %>% 
          filter(replies_received + replies_sent >= 10) %>%
          arrange(desc(reciprocity)) %>% 
          head(20)
      )
    },
    "mentions" = {
      # Mentions indicate referencing/discussing other users
      list(
        main_metric = "Times Mentioned",
        top_users = data.frame(
          user = V(graph)$name,
          mentioned_count = in_degree,
          mentioning_count = out_degree,
          mention_ratio = in_degree / (out_degree + 1),  # Ratio of being mentioned vs mentioning others
          core_number = core_numbers
        ) %>% arrange(desc(mentioned_count)) %>% head(20)
      )
    },
    "whole" = {
      # Overall network combines all interaction types
      local_clustering <- transitivity(graph, type="local")
      
      list(
        main_metric = "Overall Engagement",
        top_users = data.frame(
          user = V(graph)$name,
          total_received = in_degree,
          total_sent = out_degree,
          betweenness = betweenness_cent,
          eigenvector = eigen_cent,
          local_clustering = local_clustering,
          core_number = core_numbers
        ) %>% arrange(desc(eigenvector)) %>% head(20)
      )
    }
  )
  
  # Create rankings for different centrality measures
  # ----------------------------------------------
  centrality_rankings <- list(
    # Users receiving most interactions
    most_received = data.frame(
      user = V(graph)$name,
      in_degree = in_degree,
      core_number = core_numbers
    ) %>% arrange(desc(in_degree)) %>% head(20),
    
    # Most active users (initiating interactions)
    most_active = data.frame(
      user = V(graph)$name,
      out_degree = out_degree,
      core_number = core_numbers
    ) %>% arrange(desc(out_degree)) %>% head(20),
    
    # Users bridging different parts of the network
    bridging_users = data.frame(
      user = V(graph)$name,
      betweenness = betweenness_cent,
      in_degree = in_degree,
      core_number = core_numbers
    ) %>% 
      filter(betweenness > 0) %>%
      arrange(desc(betweenness)) %>% 
      head(20),
    
    # Users central to core discussions
    eigenvector_central = data.frame(
      user = V(graph)$name,
      eigenvector = eigen_cent,
      in_degree = in_degree,
      core_number = core_numbers
    ) %>% arrange(desc(eigenvector)) %>% head(20)
  )
  
  # Print summary statistics
  cat("\nNetwork Overview:")
  cat(paste("\n- Nodes:", n_nodes))
  cat(paste("\n- Edges:", n_edges))
  cat(paste("\n- Density:", round(density, 4)))
  cat(paste("\n- Reciprocity:", round(reciprocity, 4)))
  
  # Print additional structural metrics
  cat("\n\nStructural Metrics (indicators of echo chambers and polarization):")
  cat(paste("\n- Global Clustering Coefficient:", round(clustering_coef, 4)))
  cat(paste("\n- Average Local Clustering:", round(avg_clustering, 4)))
  cat(paste("\n- Degree Assortativity:", round(assortativity_deg, 4)))
  cat(paste("\n- Maximum Core Number:", n_core))
  
  # Print core-periphery structure
  cat("\n\nCore-Periphery Structure (shows network hierarchy):")
  cat("\nNumber of nodes in each core level:")
  print(core_sizes)
  
  # Print distribution statistics
  cat(paste("\n\n", network_type, "Distribution:"))
  cat(paste("\n- Mean interactions received:", round(mean(in_degree), 2)))
  cat(paste("\n- Median interactions received:", round(median(in_degree), 2)))
  cat(paste("\n- Users with >100 interactions:", sum(in_degree > 100)))
  cat(paste("\n- Users with >1000 interactions:", sum(in_degree > 1000)))
  
  # Print network-specific top users
  cat(paste("\n\nTop 20 Users by", network_specific$main_metric, ":"))
  print(network_specific$top_users)
  
  # Print centrality rankings
  cat("\n\nTop 20 Bridge Users (potential connections between groups):")
  print(centrality_rankings$bridging_users)
  
  cat("\n\nTop 20 Users by Eigenvector Centrality (central to core discussions):")
  print(centrality_rankings$eigenvector_central)
  
  # Return results
  return(list(
    metrics = list(
      n_nodes = n_nodes,
      n_edges = n_edges,
      density = density,
      reciprocity = reciprocity,
      clustering_coef = clustering_coef,
      avg_clustering = avg_clustering,
      assortativity_deg = assortativity_deg,
      max_core = n_core,
      core_sizes = core_sizes
    ),
    network_specific = network_specific,
    rankings = centrality_rankings,
    centrality_measures = list(
      in_degree = in_degree,
      out_degree = out_degree,
      betweenness = betweenness_cent,
      eigenvector = eigen_cent,
      core_numbers = core_numbers
    )
  ))
}

# Step 2: Analyze Each Network Type
# -------------------------------
# Analyze retweet network
retweet_analysis <- analyze_network(retweet_graph, "retweet")
save(retweet_analysis, file = "data/processed/retweet_analysis.RData")

# Analyze quote network
quote_analysis <- analyze_network(quote_graph, "quote")
save(quote_analysis, file = "data/processed/quote_analysis.RData")

# Analyze reply network
reply_analysis <- analyze_network(reply_to_graph, "reply")
save(reply_analysis, file = "data/processed/reply_analysis.RData")

# Analyze mentions network
mentions_analysis <- analyze_network(mentions_graph, "mentions")
save(mentions_analysis, file = "data/processed/mentions_analysis.RData")

# Analyze whole network
whole_analysis <- analyze_network(whole_graph, "whole")
save(whole_analysis, file = "data/processed/whole_analysis.RData")

# Save all analyses in one file
save(retweet_analysis, quote_analysis, reply_analysis, 
     mentions_analysis, whole_analysis,
     file = "data/processed/all_network_analyses.RData")

cat("\n\nAll network analyses complete. Results saved separately and combined in all_network_analyses.RData")
cat("\n\nNext steps will include:")
cat("\n1. Comparative analysis across different network types")
cat("\n2. Analysis of user roles across different interaction types")
cat("\n3. Temporal analysis of interaction patterns") 
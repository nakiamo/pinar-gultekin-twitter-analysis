# TEXT ANALYSIS: Pınar Gültekin Twitter Discourse
# Final script for hashtag analysis with refined merging logic.

# Load required libraries
library(tidyverse)
library(igraph)
library(ggraph)
library(ggplot2)
library(stringi) # For robust string manipulation

# Load preprocessed data
load("data/processed/text_analysis_data.RData")

# 1. HASHTAG NORMALIZATION AND MERGING
hashtags_merged_df <- tweets.raw.df %>%
  filter(lengths(hashtag) > 0) %>%
  tidyr::unnest(hashtag) %>%
  filter(hashtag != "" & !is.na(hashtag)) %>%

  # Step 1: Create a standardized, ASCII-based column for reliable matching
  mutate(
    hashtag_clean = str_to_lower(hashtag, locale = "tr"),
    hashtag_clean_ascii = stri_trans_general(hashtag_clean, "latin-ascii")
  ) %>%

  # Step 2: Merge standardized hashtags based on user feedback
  mutate(hashtag_final = case_when(
    # --- Specific hashtags that remain separate ---
    str_detect(hashtag_clean_ascii, "adalet") ~ "pınargültekiniçinadalet",
    str_detect(hashtag_clean_ascii, "kadincinayetleripolitiktir") ~ "kadıncinayetleripolitiktir",
    str_detect(hashtag_clean_ascii, "kadinasiddetehayir") ~ "kadınaşiddetehayır",
    str_detect(hashtag_clean_ascii, "kadinasiddetedurde") ~ "kadınaşiddetedurde",

    # --- Merged hashtag families ---
    str_detect(hashtag_clean_ascii, "kadincinayetlerinidurdur|kadincinayetlerinedurde|kadincinayetlerineson") ~ "kadıncinayetlerinidurduracağız",
    str_detect(hashtag_clean_ascii, "kadincinayeti") ~ "kadıncinayetleri", # Plural form is canonical
    str_detect(hashtag_clean_ascii, "gulistandoku") ~ "gülistandokunerede",
    str_detect(hashtag_clean_ascii, "ozgecanaslan") ~ "özgecanaslan",
    str_detect(hashtag_clean_ascii, "mugeanli") ~ "mügeanlı",
    str_detect(hashtag_clean_ascii, "sulecet") ~ "şuleçet",
    str_detect(hashtag_clean_ascii, "cemalmetinavci") ~ "cemalmetinavcı",
    str_detect(hashtag_clean_ascii, "eminebulut") ~ "eminebulut",
    str_detect(hashtag_clean_ascii, "duygudelen|duyguicinsusma") ~ "duygudelen",
    str_detect(hashtag_clean_ascii, "8mart") ~ "8martdünyakadınlargünü",
    str_detect(hashtag_clean_ascii, "istanbulsozlesmesi") ~ "istanbulsözleşmesiyaşatır",
    str_detect(hashtag_clean_ascii, "haberler") ~ "haber",
    str_detect(hashtag_clean_ascii, "mugla") ~ "muğla",
    str_detect(hashtag_clean_ascii, "kadin$") ~ "kadın", # end of string anchor
    str_detect(hashtag_clean_ascii, "kadinhaklari") ~ "kadınhakları",
    str_detect(hashtag_clean_ascii, "rtecevapver") ~ "rtecevapverturkmilletisoruyor",

    # --- General catch-alls (must come after specific cases) ---
    str_detect(hashtag_clean_ascii, "pinar|gultekin") ~ "pınargültekin",
    str_detect(hashtag_clean_ascii, "kadinasiddet") ~ "kadınaşiddet",

    # Default case
    TRUE ~ hashtag_clean
  )) %>%
  filter(!is.na(hashtag_final))

# 2. HASHTAG FREQUENCY ANALYSIS
hashtag_counts <- hashtags_merged_df %>%
  count(hashtag_final, sort = TRUE)

# Save the final counts for verification
write_csv(hashtag_counts, "output/hashtag_counts_final.csv")
cat("Final hashtag counts saved to output/hashtag_counts_final.csv\n")

# Visualize top 20 hashtags
plt_hashtags <- hashtag_counts %>%
  head(20) %>%
  mutate(hashtag = reorder(hashtag_final, n)) %>%
  ggplot(aes(x = hashtag, y = n)) +
  geom_col(fill = "#1f77b4", alpha = 0.85) +
  coord_flip() +
  theme_minimal(base_family = "Times New Roman") +
  labs(title = "Top 20 Hashtags in the Discourse (Final Cleaned)",
       x = NULL, y = "Count") +
  theme(plot.title = element_text(hjust = 0.5))

ggsave("output/top20_hashtags_final.png", plt_hashtags, width = 10, height = 7, dpi = 300)

# 3. HASHTAG CO-OCCURRENCE ANALYSIS (fixed)
hashtag_pairs <- hashtags_merged_df %>%
  group_by(id) %>%
  summarise(hashtags = list(unique(hashtag_final)), .groups = "drop") %>%
  filter(lengths(hashtags) > 1) %>%
  # Limit hashtags per tweet to prevent memory issues
  mutate(hashtags = map(hashtags, ~head(.x, 10))) %>%
  mutate(pairs = map(hashtags, ~combn(sort(.x), 2, simplify = FALSE))) %>%
  unnest(pairs) %>%
  mutate(
    hashtag1 = map_chr(pairs, 1),
    hashtag2 = map_chr(pairs, 2)
  ) %>%
  count(hashtag1, hashtag2, sort = TRUE)

top_pairs <- hashtag_pairs %>%
  head(40)

g <- graph_from_data_frame(top_pairs, directed = FALSE)

plt_cooc <- ggraph(g, layout = "fr") +
  geom_edge_link(aes(edge_width = n), alpha = 0.6, color = "lightgrey") +
  geom_node_point(size = 5, color = "#1f77b4") +
  geom_node_text(aes(label = name), repel = TRUE, size = 3.5, family = "Times New Roman") +
  theme_void(base_family = "Times New Roman") +
  labs(title = "Hashtag Co-occurrence Network (Top 40 Pairs)",
       edge_width = "Co-occurrence Count") +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "bottom")

ggsave("output/hashtag_cooccurrence_network_final.png", plt_cooc, width = 12, height = 10, dpi = 300)

cat("Hashtag analysis complete. Final visualizations saved to output/ directory.\n") 
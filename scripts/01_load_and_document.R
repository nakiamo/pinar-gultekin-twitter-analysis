# 01_load_and_document.R
# Purpose: Load the complete RData file and document all available dataframes

# Load required libraries
library(tidyverse)
library(janitor)

# Define the path to the RData file
rdata_path <- "data/raw/all.data.RData"

# Create a documentation file
doc_file <- "docs/dataframe_documentation.md"

# Load the RData file
cat("Loading RData file...\n")
load(rdata_path)

# Start documentation
cat("# Dataframe Documentation\n\n", file = doc_file)
cat("Generated on:", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "\n\n", file = doc_file, append = TRUE)

# Get list of all objects
all_objects <- ls()

# Document each dataframe
for (obj in all_objects) {
  if (is.data.frame(get(obj))) {
    df <- get(obj)
    
    # Add to documentation
    cat(sprintf("## %s\n\n", obj), file = doc_file, append = TRUE)
    cat(sprintf("- Number of rows: %d\n", nrow(df)), file = doc_file, append = TRUE)
    cat(sprintf("- Number of columns: %d\n", ncol(df)), file = doc_file, append = TRUE)
    cat(sprintf("- Size: %.2f MB\n\n", object.size(df) / (1024 * 1024)), file = doc_file, append = TRUE)
    
    # Column information
    cat("### Columns\n\n", file = doc_file, append = TRUE)
    cat("| Column Name | Type | Missing Values |\n", file = doc_file, append = TRUE)
    cat("|------------|------|----------------|\n", file = doc_file, append = TRUE)
    
    for (col in names(df)) {
      missing <- sum(is.na(df[[col]]))
      type <- class(df[[col]])[1]
      cat(sprintf("| %s | %s | %d |\n", col, type, missing), file = doc_file, append = TRUE)
    }
    cat("\n\n", file = doc_file, append = TRUE)
  }
}

# Print summary to console
cat("\nDocumentation complete!\n")
cat("Total number of dataframes:", sum(sapply(all_objects, function(x) is.data.frame(get(x)))), "\n")
cat("Documentation saved to:", doc_file, "\n")

# Save the list of dataframes for future reference
saveRDS(all_objects, "data/processed/dataframe_list.rds")

# Optional: Save a summary of dataframe sizes
size_summary <- data.frame(
  dataframe = all_objects[sapply(all_objects, function(x) is.data.frame(get(x)))],
  size_mb = sapply(all_objects[sapply(all_objects, function(x) is.data.frame(get(x)))], 
                   function(x) object.size(get(x)) / (1024 * 1024))
) %>% arrange(desc(size_mb))

write_csv(size_summary, "data/processed/dataframe_sizes.csv")

cat("\nSize summary saved to data/processed/dataframe_sizes.csv\n") 
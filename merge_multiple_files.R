# Load necessary packages
library(dplyr)
library(readr)
library(purrr)

# Get command-line arguments
args <- commandArgs(trailingOnly=TRUE)
data_file <- args[1]
output_file <- args[2]

# Read the list of file paths
file_list <- read_tsv(data_file, col_names = FALSE, show_col_types = FALSE)$X1

# Read each data file without headers, then rename columns as 1, 2, ...
data_list <- file_list %>% map(~ {
  data <- read_tsv(.x, col_names = FALSE, show_col_types = FALSE)
  colnames(data) <- as.character(seq_len(ncol(data)))  # Renames columns as "1", "2", etc.
  data
})

# Merge all data frames by the first column "1"
merged_data <- reduce(data_list, function(x, y) inner_join(x, y, by = "1"))

# Write the merged result to a file
write_tsv(merged_data, output_file)


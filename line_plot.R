# Load necessary library
library(ggplot2)

# Capture command line arguments
args <- commandArgs(trailingOnly = TRUE)
output_file <- args[1]       # Image file name
plot_title <- args[4]        # Plot title
x_axis <- args[2]      # X-axis label
y_axis <- args[3]      # Y-axis label

# Read the data from stdin without headers
data <- read.table(file("stdin"), header = FALSE, sep = "\t")

# Rename the columns
colnames(data) <- c("x", "y", "category")

# Create the plot
plot <- ggplot(data, aes(x = x, y = y, color = category, group = category)) +
  geom_line(linewidth = 1) +
  geom_point(size = 0.7) +
  labs(title = plot_title, x = x_axis, y = y_axis) +
  theme_bw()

# Save the plot
ggsave(output_file, plot)
print(plot)


# coding_assignments

## Q1:Selecting lines from stdin (Python Code + Linux Command)

This assignment involves a script that efficiently filters gene data from a large compressed file based on a list of selected IDs. The script leverages bash and a Python program to identify and output lines containing specific gene identifiers, using a pipeline that helps with large datasets.

## Overview

The provided pipeline performs the following tasks:
1. `zcat data/q1_data.tsv.gz`  Decompresses a `.gz` compressed file containing gene data.
2. `awk 'NR==1||/ENSG/'` Filters the decompressed data to include only lines that contain certain identifiers(*ENSG in this case*).
3. `python3 collect.py data/to_select.tsv > newfile.tsv` Outputs the filtered data to a new file.

### Command to Run the Code

The full command to execute the script is as follows:

```bash

zcat data/q1_data.tsv.gz | awk 'NR==1||/ENSG/' | python3 collect.py data/to_select.tsv > newfile.tsv 
```

## Q2: Plotting a group of lines ( R + Linux Command)

This script generates a line plot based on tab-separated input data, making use of the `ggplot2` library in R. The plot displays data points connected by lines, grouped by category.

## Overview

The R script performs the following tasks:
1.  Reads data from the standard input, which is piped from a file or another command (`cat data/q2_data.tsv`).
2. Accepts command-line arguments for output filename, x-axis label, y-axis label, and plot title (`Rscript line_plot.R "different_clusters.png" "Relative from center [bp]" "Enrichment over Mean" "MNase fragment profile"`).
3. Plots the data using `ggplot2`, distinguishing between different categories with color.
4. Saves the resulting plot as a PNG image file named after the argument (`"different_clusters.png"`).

### Command to Run the Script

To execute the script, use the following command:

```bash
$ cat data/q2_data.tsv | Rscript line_plot.R "different_clusters.png" "Relative from center [bp]" "Enrichment over Mean" "MNase fragment profile"

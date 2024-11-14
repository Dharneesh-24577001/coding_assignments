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
```


## Q3: Merging Multiple Files (R + Linux Command)

This script merges multiple files listed in a specified input file, aligning them by a common identifier (the first column in each file).The merged result is then saved to a specified output file.

### Overview

The R script performs the following tasks:
1. **Reads** a list of data file names from an input file (`data/list_q3.tsv`), where each line contains the path to a data file.
2. **Loads** each listed data file into a separate data frame.
3. **Renames** the columns in each data frame to sequential integers (`1`, `2`, etc.), ensuring consistency across files.
4. **Merges** all data frames by the first column (`1`) using an inner join, retaining only rows with matching values in this column across all files.
5. **Writes** the final merged data to an output file (`data/join_output.tsv`).

### Command to Run the Script

The full command to execute the script is as follows:

```bash
Rscript merge_multiple_files.R data/list_q3.tsv data/join_output.tsv
```


## Q4: Label with quantiles (Python)

This Python script separates a given data file into specified quantiles. The number of quantiles is provided as a command-line argument. The script uses the `pandas` library to load the data, calculate the quantiles, and display the values along with their corresponding quantile ranges.

### Overview

The Python script performs the following tasks:
1. **Reads** a tab-separated (TSV) file from the input argument (`data/q4_data.tsv`).
2. **Accepts** a second argument specifying the number of quantiles (`'4'` for example).
3. **Calculates** the specified number of quantiles for the data.
4. **Labels** the quantiles as `q1`, `q2`, etc., and assigns each data value to a corresponding quantile.
5. **Displays** the values along with their quantile labels and ranges.

### Command to Run the Script

The full command to execute the script is as follows:

```bash
python3 quantile.py data/q4_data.tsv '4'


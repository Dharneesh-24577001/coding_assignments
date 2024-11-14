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

**bash**

zcat data/q1_data.tsv.gz | awk 'NR==1||/ENSG/' | python3 collect.py data/to_select.tsv > newfile.tsv

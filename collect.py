import sys
import pandas as pd # pandas library

filex=sys.argv[1] # First command-line argument is the file with IDs
df=pd.read_csv(filex, names=['ID']) # Load IDs into a DataFrame

view=list(df['ID']) # Convert the 'ID' column to a list for quick searching

for line in sys.stdin: # standard input
    for marker in view: # Check each marker (ID) in the list
        if marker in line: # If the marker is found in the line
            print(line,end='')  #Output the matching line
            break # Stop searching once a match is found


import sys #importing sys
import pandas as pd #importing pandas library

#passing variables for accessing...
main_file=sys.argv[1] #accessing the file
quantile_no=int(sys.argv[2]) # accessing the integer on how many quantiles we need
quantile_labels= [f'q{i+1}' for i in range(quantile_no)] #labeling quantiles

#read file
df=pd.read_csv(main_file, header= None, sep='\t').squeeze("columns")

#creating the quantiles range for the data
quantile=pd.qcut(df,quantile_no,quantile_labels)
quantile_range=pd.qcut(df,quantile_no)

#creating a new dataframe and printing it
numericals=pd.DataFrame({'values':df, 'quantiles':quantile, 'quantile_range':quantile_range})
print(numericals)

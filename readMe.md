
These are the fallowing files included
- run_analysis.R
- codebook.md
- tidyData.csv
- cominedMean.csv
- combinedStd.csv


run_analysis.R: file contain main function combine_and_tidyup_data to combine and test & train data. Create group by data of activity with lables, subject and mean&std of all measurements
this function require no arguments, expect to run at the root of data directory. Transformed all activity to lables.

codebook.md: contains all column headers for tidy up data.

tidyData.csv: file contain final dataset of measurements by subject and activity label

cominedMean.csv & combinedStd.csv: these are the combined dataset values of mean and std

The data used to generate the files in this repository was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on 2014 04 15. 
For detailed information about the data see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

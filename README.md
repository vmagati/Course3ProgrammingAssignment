# Course 3: Getting and Cleaning Data Peer-Graded Assignment
This repo contains three files used for running analysis on the data collected through the Human Activity Recognition Using Smartphones experiment.

A full description of the experiment can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset used for analysis can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Files in Repo
- run_analysis.R is a script file that reads in the dataset and performs the following:
  - merges the training and the test sets to create one data set
  - extracts only the measurements on the mean and standard deviation for each measurement
  - uses descriptive activity names to name the activities in the data set
  - appropriately labels the data set with descriptive variable names
  - from the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
- Tidy_Data.txt is a text file that is final, exported data produced by the script file run_analysis.R
- codeBook.md is a code book describing the variables of the text file Tidy_Data.txt

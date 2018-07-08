# GettingAndCleaningData
This project is part of the coursera course "Getting and Cleaning Data".  The dataset represents data collected from accelerometers Samsung Galaxy S Smartphone in various positions as part of the University of California,Irvine study mentioned in the url : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . The requirements are as follows :
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3 . Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.




The file name is run_analysis.R
To run the file we use the command : 
## source("run_analysis.R").



A tidy data set called "tidy_data.txt" would be created.
To view the contents in R, simply run the statement :  
## tidyData <- read.table("tidy_data.txt")


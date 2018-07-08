## Downloading the zip file from the given URL
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "UCI.zip",method = "curl")
unzip("UCI.zip")
## Step 1 To merge the two datasetes train and test from lines 6 to 14
train_X <- read.table("UCI HAR Dataset/train/X_train.txt")
train_Y <- read.table("UCI HAR Dataset/train/y_train.txt",col.names = "activity")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names = "subject")
train <- cbind(train_X,train_subject,train_Y)
test_X <- read.table("UCI HAR Dataset/test/X_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names = "subject")
test_Y <- read.table("UCI HAR Dataset/test/y_test.txt",col.names = "activity")
test <- cbind(test_X,test_subject,test_Y)
finalData <- rbind(train,test)
## Step 2 : Extracting mean and SD from the dataset from lines 16 to 19
featureList <- read.table("UCI HAR Dataset/features.txt",col.names = c("id","name"))
featureName <- as.vector(featureList[,"name"])
reqd_feature_ids <- grepl("mean|std",featureName) & !grepl("meanFreq",featureName)
meanStdData <- finalData[reqd_feature_ids]
## Step 3 : Descriptive activity names for dataset from lines 21 to 24
activityNames <- read.table("UCI HAR Dataset/activity_labels.txt",col.names =  c("id","name"))
for (i in 1:nrow(activityNames)){
        meanStdData$activity[meanStdData$activity==activityNames[i,"id"]] <- as.character(activityNames[i,"name"])
}
## Step 4 Appropriate label of dataset from line 26 to 34
rename_feature_names <- featureName[reqd_feature_ids]
rename_feature_names <- gsub("^f(.*)$","\\1-frequency",rename_feature_names)
rename_feature_names <- gsub("^t(.*)$","\\1-time",rename_feature_names)
rename_feature_names <- gsub("Mag","\\1-magnitude",rename_feature_names)
rename_feature_names <- gsub("Acc","\\1-acceleration",rename_feature_names)
rename_feature_names <- gsub("BodyBody","Body",rename_feature_names)
rename_feature_names <- tolower(rename_feature_names)
rename_feature_names <- append(rename_feature_names , c("subject","activity"))
names(meanStdData) <- rename_feature_names
## Step 5 Creaing the second independent tidy dataset from lines 36 to 41
library(dplyr)
tidyData <- tbl_df(meanStdData)
tidyData <- group_by(tidyData,subject,activity)
tidyData <- summarise_all(tidyData,funs(mean))
tidyData <- gather(tidyData,measurement,mean,-activity,-subject)
write.table(tidyData,file = "tidy_data.txt",row.names = FALSE)
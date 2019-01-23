##Assuming data.table package is installed, zip file is downloaded and saved under working directory, 
##read and assign all data frames
features <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

##Part 1: Merge the training and the test sets to create one data set
X <- rbind(x_test, x_train)
Y <- rbind(y_test, y_train)
Subject <- rbind(subject_test, subject_train)
mergedData <- cbind(Subject, Y, X)

##Part 2: Extract only the measurements on the mean and standard deviation for each measurement
Measurements <- grep("mean\\(\\)|std\\(\\)", features[,2])
X <- X[, Measurements]

##Part 3: Use descriptive activity names to name the activities in the data set
Y[,1] <- activities[Y[, 1], 2]

##Part 4: Appropriately label the data set with descriptive variable names
names(X) <- features[Measurements, 2]
names(Subject) <- "Subject"
names(Y) <- "Activity"
cleanData <- cbind(Subject, Y, X)

##Part 5: From the data set in step 4, create a second, independent tidy data set 
##with the average of each variable for each activity and each subject
cleanData <- data.table(cleanData)
tidyData <- cleanData[, lapply(.SD, mean), by = "Subject,Activity"]

write.table(tidyData, file = "Tidy_Data.txt", row.names = FALSE)
print(tidyData)

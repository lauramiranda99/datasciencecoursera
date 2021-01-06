# Packages

library(data.table)
library(plyr)

# Step 0 =================================
# Creates a working directory and prepares data

if(!file.exists("data")){
      dir.create("data")}

urlFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(urlFile, destfile=".data/UCI HAR Dataset.zip")
unzip(zipfile = "./UCI HAR Dataset.zip")

s_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE)

s_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE)

# Step 1 =================================
# Merges the training and the test sets to create one data set.

x_table <- rbind(x_test, x_train)
y_table <- rbind(y_test, y_train)
s_table <- rbind(s_test, s_train)

names(s_table)   <- "subject"
names(y_table) <- "activity"
names(x_table) <- features$V2

dataset <- cbind(x_table, y_table, s_table)

# Step 2 =================================
# Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("./data/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

mean_std <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]

columns <- c(as.character(mean_std), "subject", "activity" )
dataset <- subset(dataset, select=columns)

# Step 3 =================================
# Uses descriptive activity names to name the activities in the data set.

activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

dataset$activity <- activity[dataset$activity, 2]

# Step 4 =================================
# Appropriately labels the data set with descriptive variable names. 

names(dataset) <- gsub("\\()", "", names(dataset))
names(dataset) <- gsub("-mean", "Mean", names(dataset))
names(dataset) <- gsub("-std", "Std", names(dataset))
names(dataset) <-gsub("^t", "time", names(dataset))
names(dataset) <-gsub("^f", "frequency", names(dataset))
names(dataset) <-gsub("Acc", "Accelerometer", names(dataset))
names(dataset) <-gsub("Gyro", "Gyroscope", names(dataset))
names(dataset) <-gsub("Mag", "Magnitude", names(dataset))
names(dataset) <-gsub("BodyBody", "Body", names(dataset))

# Step 5 =================================
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

finalDataset <- ddply(dataset, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(finalDataset, "tidy_data.txt", row.name=FALSE)

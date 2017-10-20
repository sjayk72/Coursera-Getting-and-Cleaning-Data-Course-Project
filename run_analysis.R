# Download file from url below
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(url, destfile = "~/R/runDataset.zip", mode = "wb")

#Load the library for data frame
library(plyr)

#1 Merges the training and the test sets to create one data set.
#Read test data
Xtest <- read.table("~/R/UCI HAR Dataset/test/X_test.txt")
Ytest <- read.table("~/R/UCI HAR Dataset/test/y_test.txt")
subjtest <- read.table("~/R/UCI HAR Dataset/test/subject_test.txt")

#Read train data
Xtrain <- read.table("~/R/UCI HAR Dataset/train/X_train.txt")
Ytrain <- read.table("~/R/UCI HAR Dataset/train/y_train.txt")
subjtrain <- read.table("~/R/UCI HAR Dataset/train/subject_train.txt")

#Merge data set from test and train
dataset <- rbind(Xtest, Xtrain)

#Merge activity labels
activity <- rbind(Ytest, Ytrain)

#Merge subject
subject <- rbind(subjtest, subjtrain)

#2 Extracts only the measurements on the mean and standard deviation for 
#each measurement.

#Read features.txt file, we see the measurement name is on column 2
features <- read.table("features.txt")

# Select only mean() or std() in features
mean_and_std <- grep("-(mean|std)\\(\\)", features[, 2])

# Select columns with mean() or std() features
dataset <- dataset[, mean_and_std]


#3 Uses descriptive activity names to name the activities in the data set
# Read the activities from activity_labels.txt
activities <- read.table("~/R/UCI HAR Dataset/activity_labels.txt")

# update values with correct activity names
activity[, 1] <- activities[activity[, 1], 2]


#4 Appropriately labels the data set with descriptive variable names. 

# Put the proper measurement column names
names(dataset) <- features[mean_and_std, 2]

# update column name
names(activity) <- "activity"
names(subject) <- "subject"

#Merge all
df <- cbind(dataset, activity, subject)

#5 From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.

averages <- ddply(df, .(subject, activity), function(x) colMeans(x[, 1:66]))

# Write the output file to the same data directory
write.table(averages, "~/R/UCI HAR Dataset/averages.txt", sep = "\t")
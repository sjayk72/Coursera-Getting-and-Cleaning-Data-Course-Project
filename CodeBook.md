## Getting Data
Data for the project was found on this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
Download the data and extract them.

## Variables
Information on README.txt from downloaded file as follow.
The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

## Cleaning Data
1 Merges the training and the test sets to create one data set.
- Read data set, label and activity label for test and training data 
- Merge each data set from test and train
- Data set, label and activity label will be merged later on after filtering the measurement on data set

2 Extracts only the measurements on the mean and standard deviation for each measurement.
- Get the measurement from features.txt file, select only mean() or std() using grep.
- Select the columns with mean or std from dataset, 66 columns was selected.

3 Uses descriptive activity names to name the activities in the data set
- Read the activities from activity_labels.txt and replace the number with descriptive activities.

4 Appropriately labels the data set with descriptive variable names. 
- Put the proper measurement , activity and subject columns name then merge the 3 data set. 
- Now we have 68 columns.

5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- Get the average of the 66 measurements using ddply split by subject and activity.
- Write the output file to the same data directory

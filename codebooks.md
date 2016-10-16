
Introduction
The provided data set is about , Human Activity Recognition Using Smartphones Dataset.The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Source data set download location - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

We need to download this dataset from the source location. It will be compressed dataset. We need to uncompress/unzip the dataset.

Required dataset which has to be read for further processing -
activity_labels <-  read.table("./UCI HAR Dataset/activity_labels.txt")
features <- ("./UCI HAR Dataset/features.txt")    
subject_train <- ("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- ("./UCI HAR Dataset/test/subject_test.txt")
X_train <- ("./UCI HAR Dataset/train/X_train.txt")
X_test <- ("./UCI HAR Dataset/test/X_test.txt")
Y_train <- ("./UCI HAR Dataset/train/y_train.txt")
Y_test <- ("./UCI HAR Dataset/test/y_test.txt")


Processing logic for transformation 

mean_and_standard_deviation.txt ->
Merge the data for subject_train,subject_test,x_train,x_test,y_train and y_test
Name the column from the features
applied activity naming to the activity columns
extracted_data is produced by filtering only subject, activity, mean, std columns
write the output to mean_and_standard_deviation.txt 

tidy_data_set.txt
Data set is aggregated by subject and by activity by calculating the mean
write the output to tidy_data_set.txt
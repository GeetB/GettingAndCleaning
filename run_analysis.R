# Making up the reqired dataset and writing the required data set 
    run_analysis_function <- function () {
	
	# Source the downloader function for the data set
	source('D:/DataScience_New/UCI HAR Dataset/dowloader_function.R')
    downloader()
	
	#Read the data set into the different variables
    filesPath <- "D:/DataScience_New/UCI HAR Dataset"
    setwd(filesPath)
    activity_labels <-  read.table("./UCI HAR Dataset/activity_labels.txt")
    features <-  read.table("./UCI HAR Dataset/features.txt")    
    subject_train <-  read.table("./UCI HAR Dataset/train/subject_train.txt")
    subject_test <-  read.table("./UCI HAR Dataset/test/subject_test.txt")
    X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
    X_test <-  read.table("./UCI HAR Dataset/test/X_test.txt")
    Y_train <-  read.table("./UCI HAR Dataset/train/y_train.txt")
    Y_test <-  read.table("./UCI HAR Dataset/test/y_test.txt")
	
	#Merge the data set and write the required data set
    subjectMerge_data <- rbind(subject_test, subject_train)
    xMerge_data <- rbind(X_test, X_train)
    yMerge_data <- rbind(Y_test, Y_train)
    names(xMerge_data) <- features$V2
    names(subjectMerge_data) <- c("subject")
    names(yMerge_data) <- c("activity")
    data_all <- cbind(subjectMerge_data, yMerge_data, xMerge_data)
    data_all$activity <- factor(data_all$activity,activity_labels[[1]],activity_labels[[2]])
    mean_or_sd <- grepl("subject|activity|mean|std", names(data_all))
    extracted_data <- data_all[mean_or_sd]
    write.table(extracted_data, file="mean_and_standard_deviation.txt")
    
    tidy_data <- aggregate(data_all, by=list(data_all$subject, data_all$activity), FUN=mean)
    write.table(tidy_data, file="tidy_data_set.txt", row.names=FALSE)    
}
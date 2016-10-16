#Function to download data and unzip the data set 
downloader <- function() {
filesPath <- "D:/DataScience_New/UCI HAR Dataset"
setwd(filesPath)
if(!file.exists("./downloaded_data")){dir.create("./downloaded_data")}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="./downloaded_data/mydata.zip",method="libcurl")
unzip(zipfile="./downloaded_data/mydata.zip")
}
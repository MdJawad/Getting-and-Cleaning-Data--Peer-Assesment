## Get and set the current working directory
library(plyr)
##setwd("** path here **")
getwd()


## Read different variables
## Read from the training data set 
x.train <- read.table("../UCI HAR Dataset/train/x_train.txt")
y.train <- read.table("../UCI HAR Dataset/train/y_train.txt")
subject.train <- read.table("../UCI HAR Dataset/train/subject_train.txt")

## Read from the test data set

x.test <- read.table("../UCI HAR Dataset/test/x_test.txt")
y.test <- read.table("../UCI HAR Dataset/test/y_test.txt")
subject.test <- read.table("../UCI HAR Dataset/test/subject_test.txt")

## Bind the training and the test data sets

x.data <- rbind(x.train, x.test)
y.data <- rbind(y.train, y.test)
subject <- rbind(subject.train, subject.test)

###########################################################################################

## Read only the features that are the name and standard deviation of the units of measurements

## Read the features of the data set
features <- read.table("../UCI HAR Dataset/features.txt")
## Using regex patterns with the grep command to extract the feature names 
int.features <- grep("-(mean|std)\\(",features[,2])
int.features
 
## Only the desired features are extracted from the data
sub.x.data <- x.data[,int.features]

## Assign the names to the data frame

names(sub.x.data) <- features[int.features,2]

###########################################################################################

## Uses descriptive activity names to name the activities in the data set

activity <- read.table("../UCI HAR Dataset/activity_labels.txt")
y.data[,1] <-activity[y.data[,1],2]
names(y.data) <- "Activity"

###########################################################################################
names(subject)<- "ID"
DF <- cbind(subject,sub.x.data )
DF <- cbind(DF,y.data)

## Find the average for each activity for each subject

DF2 <-ddply(DF, .(ID, Activity), colwise(mean))
write.table(DF2, "FinalDataSet.txt", row.name=FALSE)
 
###########################################################################################









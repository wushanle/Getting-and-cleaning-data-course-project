#######################################################################
# Mergin and clean the origin data set to obtain the tidy data set
#######################################################################

## Read in data

Dir = "C:/Users/momo/Desktop/Coursera/3. Getting and cleaning data/Project/"
sub_test = read.table( paste(Dir, "UCI HAR Dataset/test/subject_test.txt", sep="") )  #indicate which volunteer; level 1:30
x_test = read.table( paste(Dir, "UCI HAR Dataset/test/X_test.txt", sep="") )  # test dataset with 561 features
y_test = read.table( paste(Dir, "UCI HAR Dataset/test/y_test.txt", sep="") ) # indicate which activity; level 1:6
sub_train = read.table( paste(Dir, "UCI HAR Dataset/train/subject_train.txt", sep="") )  # indicate which volunteer; level 1:30
x_train = read.table( paste(Dir, "UCI HAR Dataset/train/X_train.txt", sep="") )  # trainig dataset with 561 features
y_train = read.table( paste(Dir, "UCI HAR Dataset/train/y_train.txt", sep="") )  # indicate which activity: level 1:6
features = read.table( paste(Dir, "UCI HAR Dataset/features.txt", sep="") )  # names of measures


## Merge test and training dataset
sub = rbind(sub_test, sub_train)
x = rbind(x_test, x_train)
y = rbind(y_test, y_train)

data = cbind(sub, y, x)

# Name the variables
colnames(data) = c("Subject", "Activity", as.character(features[, 2]))

## Extract mean and standard deviation of each measure

m = grep("mean()", colnames(data), fixed = TRUE)
s = grep("std()", colnames(data), fixed = TRUE)

data = data[, c(1,2,sort(union(m,s)))]

## Name the activities in the data set

data[data[, "Activity"]==1, "Activity"] = "Walking"
data[data[, "Activity"]==2, "Activity"] = "Walking_upstairs"
data[data[, "Activity"]==3, "Activity"] = "Walking_downstairs"
data[data[, "Activity"]==4, "Activity"] = "Sitting"
data[data[, "Activity"]==5, "Activity"] = "Standing"
data[data[, "Activity"]==6, "Activity"] = "Laying"

## Simplify the variable name by removing ()
a = colnames(data)
colnames(data) = sub("()", "", a, fix=TRUE)

## Creates an independent tidy data set with the average of each variable for each activity and each subject

data2 = aggregate(data[, 3]~data[, 1]+data[, 2], data, mean) # Calculate the mean for the 1st measure for each activity and subject

for (i in 4:68)
{
      data2 = cbind(data2, aggregate(data[, i]~data[, 1]+data[, 2], data, mean)[, 3])  # Combind the mean for the 2nd to 66th measures to the dataframe
}      

colnames(data2) = colnames(data) # Name the variables

write.table(data2, paste(Dir, "TidyData.txt", sep=""), row.name=FALSE)  # Outout the tidy dataset

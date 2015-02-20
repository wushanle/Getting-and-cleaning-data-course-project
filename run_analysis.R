## Read in data

Dir = "C:/Users/momo/Desktop/Coursera/3. Getting and cleaning data/Project/"
sub_test = read.table( paste(Dir, "UCI HAR Dataset/test/subject_test.txt", sep="") )  #indicate which volunteer; level 1:30
x_test = read.table( paste(Dir, "UCI HAR Dataset/test/X_test.txt", sep="") )  # test dataset with 561 features
y_test = read.table( paste(Dir, "UCI HAR Dataset/test/y_test.txt", sep="") ) # indicate which activity; level 1:6
sub_train = read.table( paste(Dir, "UCI HAR Dataset/train/subject_train.txt", sep="") )  # indicate which volunteer; level 1:30
x_train = read.table( paste(Dir, "UCI HAR Dataset/train/X_train.txt", sep="") )  # trainig dataset with 561 features
y_train = read.table( paste(Dir, "UCI HAR Dataset/train/y_train.txt", sep="") )  # indicate which activity: level 1:6
features = read.table( paste(Dir, "UCI HAR Dataset/features.txt", sep="") )  # names of measures


## Merge dataset
sub = rbind(sub_test, sub_train)
x = rbind(x_test, x_train)
y = rbind(y_test, y_train)

a = c(rep("test", 2947), rep("train", 7352))
dim(a) = c(length(a), 1)

data = cbind(a[, 1], sub, y, x)

# Name the variables
colnames(data) = c("Test/Train", "Subject", "Activity", as.character(features[, 2]) )

## Extract mean and standard deviation of each measure

m = grep("mean()", colnames(data), fixed = TRUE)
s = grep("std()", colnames(data), fixed = TRUE)

data = data[, c(1,2,3,sort(union(m,s)))]

## Name the activities in the data set

data[data[, "Activity"]==1, "Activity"] = "Walking"
data[data[, "Activity"]==2, "Activity"] = "Walking_upstairs"
data[data[, "Activity"]==3, "Activity"] = "Walking_downstairs"
data[data[, "Activity"]==4, "Activity"] = "Sitting"
data[data[, "Activity"]==5, "Activity"] = "Standing"
data[data[, "Activity"]==6, "Activity"] = "Laying"

## Labels the data set with descriptive variable names
a = colnames(data)
colnames(data) = sub("()", "", a, fix=TRUE)

## Creates an independent tidy data set with the average of each variable for each activity and each subject


data2 = aggregate(data[, 4]~data[, 2]+data[, 3], data, mean)

for (i in 5:69)
{
      data2 = cbind(data2, aggregate(data[, i]~data[, 2]+data[, 3], data, mean)[, 3])
}      

colnames(data2) = colnames(data)[2:69]

write.table(data2, paste(Dir, "TidyData.txt", sep=""), row.name=FALSE)

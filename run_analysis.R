# Getting and Cleaning Data Course Project code
###############################################################################

library(plyr)

# 1) Merge the training and test sets to create one data set
###############################################################################

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create 'x' data set
x_data <- rbind(x_train, x_test)

# create 'y' data set
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

# 2) Extract only the measurements on the mean and standard deviation for each measurement
###############################################################################

features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_std_data <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
x_data <- x_data[, mean_std_data]

# update the column names
names(x_data) <- features[mean_std_data, 2]

# 3) Use descriptive activity names to name the activities in the data set
###############################################################################

activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# column name updation
names(y_data) <- "activity"

# 4) Appropriately label the data set with descriptive variable names
###############################################################################

# column name updation
names(subject_data) <- "subject"

# Combining all the data in a single data set
finaldata <- cbind(x_data, y_data, subject_data)

# 5) Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
###############################################################################

data_averages <- ddply(finaldata, .(subject, activity), function(z) colMeans(z[, 1:66]))
write.table(data_averages, "Output.txt", row.name=FALSE)

# End of program
################################################################################
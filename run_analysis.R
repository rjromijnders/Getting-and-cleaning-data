###
### PRE-PROCESSING
###

rm(list = ls())
library(dplyr)

# set the working directory -- where the "UCI HAR Dataset" folder is located
work_dir <- "D:\\Scripts\\R\\03_Data_cleaning\\wk04\\data\\UCI HAR Dataset"
setwd(dir = work_dir)


###
### READ DATA
###
# read the activity and feature labels
activity_labels <- read.table(file = "activity_labels.txt", header = FALSE, sep = " ", colClasses = c("factor", "character"), col.names = c("activity_id", "activity_label"))
feature_labels <- read.table("features.txt", header = FALSE, sep = " ", colClasses = c("factor", "character"), col.names = c("feature_id", "feature_label"))

# read the data sets
X_train <- read.fwf("./train/X_train.txt", header = FALSE, widths = rep(16, 561))
Y_train <- read.table("./train/y_train.txt", header = FALSE, colClasses = c("factor"), col.names = c("activity_id"))
subject_train <- read.table("./train/subject_train.txt", header = FALSE, colClasses = c("factor"), col.names = c("subject_id"))

X_test <- read.fwf("./test/X_test.txt", header = FALSE, widths = rep(16, 561))
Y_test <- read.table("./test/y_test.txt", header = FALSE, colClasses = c("factor"), col.names = c("activity_id"))
subject_test <- read.table("./test/subject_test.txt", header = FALSE, colClasses = c("factor"), col.names = c("subject_id"))


###
### PROCESS DATA SETS
###
# merge training & test data into single data frame
smartphone_data <- rbind(cbind(subject_train, Y_train, X_train), cbind(subject_test, Y_test, X_test))
rm(X_train, Y_train, subject_train, X_test, Y_test, subject_test)
colnames(smartphone_data) <- c("subject_id", "activity_id", feature_labels[, 2])

# define which feature columns are preserved
features_wanted <- grep("subject_id|mean|std|activity_id", colnames(smartphone_data))
smartphone_data <- smartphone_data[, features_wanted]

# replace activity ID with the appropriate label
smartphone_data$activity_id <- factor(smartphone_data$activity_id, levels = activity_labels$activity_id, labels = activity_labels$activity_label)


###
### CLEAN UP COLUMN NAMES and USE DESCRIPTIVE LABELS
###
smartphone_data_column_names <- colnames(smartphone_data)
smartphone_data_column_names <- gsub("[\\(\\)-]", "", smartphone_data_column_names)
##smartphone_data_column_names <- gsub("^f", "frequencyDomain", smartphone_data_column_names)
##smartphone_data_column_names <- gsub("^t", "timeDomain", smartphone_data_column_names)
##smartphone_data_column_names <- gsub("Acc", "Accelerometer", smartphone_data_column_names)
##smartphone_data_column_names <- gsub("Gyro", "Gyroscope", smartphone_data_column_names)
##smartphone_data_column_names <- gsub("Mag", "Magnitude", smartphone_data_column_names)
##smartphone_data_column_names <- gsub("Freq", "Frequency", smartphone_data_column_names)
smartphone_data_column_names <- gsub("mean", "Mean", smartphone_data_column_names)
smartphone_data_column_names <- gsub("std", "Std", smartphone_data_column_names)
smartphone_data_column_names <- gsub("BodyBody", "Body", smartphone_data_column_names)
colnames(smartphone_data) <- smartphone_data_column_names


##
## CREATE A SECOND DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
##
smartphone_data_means <- smartphone_data %>% group_by(subject_id, activity_id) %>% summarise_all(funs(mean))

# write to new file
write.table(smartphone_data_means, "tidy_data.txt", row.names = FALSE, quote = FALSE)
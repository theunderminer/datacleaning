# Load data sets
train <- read.table("UCI HAR Dataset/train/X_train.txt")
train[,562] <- read.table("UCI HAR Dataset/train/y_train.txt")
train[,563] <- read.table("UCI HAR Dataset/train/subject_train.txt")

test <- read.table("UCI HAR Dataset/test/X_test.txt")
test[,562] <- read.table("UCI HAR Dataset/test/y_test.txt")
test[,563] <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge train en test set in one dataset (step 1)
fullDataset <- rbind(train, test)

# Load the names of the measurements
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors=F)
names(fullDataset) <- c(features[,2], "activity", "subject")

# Select the indices of the mean() and std() columns
meanStdCols <- grep("-std\\(\\)|-mean\\(\\)", features$V2)
# We want the mean() and std() columns together with activity and subject
cols <- c(meanStdCols, 562, 563)
# Extracts only the measurements on the mean and standard deviation for each measurement. (step 2)
dataset <- fullDataset[,cols]

# Load the names of the activity labels and store is as factor levels
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
dataset$activity <- as.factor(dataset$activity)
# (step 3)
levels(dataset$activity) <- activity_labels$V2

# Subject is a factor
dataset$subject <- as.factor(dataset$subject)

# Clean/descriptive variable names (step 4)
names(dataset) <- tolower(gsub("[-()]", "", names(dataset)))

# data set with the average of each variable for each activity and each subject (step 5)
tidyset <- aggregate(dataset[,1:66], list(activity = dataset$activity, 
                                   subject = dataset$subject), mean)
write.table(tidyset, "tidyset.txt", row.names=F)

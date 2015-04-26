
## Step 1

# Read the training data from the text files
x.train   <- read.table("train//X_train.txt")
y.train   <- read.table("train//Y_train.txt")
sub.train <- read.table("train//subject_train.txt")

# Read the test data from the text files
x.test   <- read.table("test//X_test.txt")
y.test   <- read.table("test//Y_test.txt")
sub.test <- read.table("test//subject_test.txt")

# Merge the training and test data sets
x.data   <- rbind(x.train, x.test)
y.data   <- rbind(y.train, y.test)
sub.data <- rbind(sub.train, sub.test)

###########################################################

## Step 2

# Read the features
features.set  <- read.table("features.txt")

# Find the mean and standard deviation features
mean.features <- grep(".*mean\\(\\).*", features.set[,2])  # 33 mean() features
std.features  <- grep(".*std\\(\\).*", features.set[,2])   # 33 std() features
filter.idx    <- c(mean.features, std.features)            # 66 features

# Extract only the measurements based on those features
x.data <- x.data[,c(filter.idx)]        

# Add the feature names to the respective column names
names(x.data) <- features.set[filter.idx, 2]

###########################################################

## Step 3

# Read the activity labels
activity.labels <- read.table("activity_labels.txt")

# Rename the activities with descriptive activity names
y.data[,1] <- activity.labels[y.data[,1], 2]

###########################################################

## Step 4

# Label the data set with descriptive variable names
names(y.data)   <- "activity"
names(sub.data) <- "subject"

# Create single data set merging all the columns
merged.data <- cbind(x.data, y.data, sub.data)

###########################################################

## Step 5

# Create tidy data set with the average of each variable for each activity and each subject
library(plyr)
avg.data <- ddply(merged.data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# Write the tidy data set into a .txt file
write.table(avg.data, "avg_data.txt", row.names=F)

###########################################################
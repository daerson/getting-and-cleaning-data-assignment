## 0. Download the dataset from the site and unzip it to the correct folder

        # Downloads the dataset
        fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileurl,
                      destfile="getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                      method = "curl")

        # Unzips the dataset
        unzip("getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", overwrite=TRUE)

        
        
## 1.Merges the training and the test sets to create one data set.

        # read and merge the activity datasets
        train_activity <- read.table("./UCI HAR Dataset/train/y_train.txt")
        test_activity <- read.table("./UCI HAR Dataset/test/y_test.txt")
        activity <- rbind(test_activity, train_activity)
        
        # read and merge the subject datasets
        train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        subject <- rbind(test_subject, train_subject)
        
        # read and merge the measurement datasets
        test_measurement <- read.table("./UCI HAR Dataset/test/X_test.txt")
        train_measurement <- read.table("./UCI HAR Dataset/train/X_train.txt")
        measurement <- rbind(test_measurement, train_measurement) 

        

## 2.Extracts only the measurements on the mean and standard deviation for each measurement.

        # read features dataset
        features <- read.table("./UCI HAR Dataset/features.txt")
        
        # fix column names
        names(features) <- c("featureid","name")
        
        # identify features with "-mean()" or "-std()" in the feature name
        id_features <- grep("-mean\\(\\)|-std\\(\\)", features$name)
        
        # select only the columns that matches with id_features
        measurement <- measurement[, id_features]

        

## 3.Uses descriptive activity names to name the activities in the data set

        # uses the id_features (from the previous step) to get the feature names
        # and remove the "()" from the names
        # and tranform them to lower case
        names(measurement) <- tolower(sub("\\(\\)", "", features[id_features,2]))



## 4.Appropriately labels the data set with descriptive variable names.

        # read activity_labels dataset
        activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
        
        # fix column names
        names(activity_labels) <- c("activityid","activity")
        
        # replace activityid with the activity name from the activity label dataset
        activity[, 1] <- activity_labels[activity[, 1], 2]



## 5 From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

        # merge the three datasets (measurement, activity and subject)
        tidyds <- cbind (subject, activity, measurement)
        
        # group by subjectid and activity and calculte the mean
        tidyds <- aggregate(tidyds[, 3:ncol(tidyds)],by = list(tidyds[,1], tidyds[,2]), mean)
        
        # fix the column names created by the aggregate fucntion
        names(tidyds)[1:2] <- c("subjectid", "activity")
        
        # save results to a txt
        write.table(tidyds, "tidy.txt", row.name=FALSE)
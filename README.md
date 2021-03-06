## Objective

As per the course assignment, the `run_analysis.R` script does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Saves the tidy dataset from step 5 as a txt file named `tidy.txt`

In addition, as step 0, the script also downloads the dataset (from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzips it to right folder ("`./UCI HAR Dataset`") in the working directory.

## Contents of this repository

- `README.md`: this file
- `run_analysis.R`: the script as described in the objectives
- `CodeBook.md`: indicates all the variables and summaries calculated, along with units, and any other relevant information

After the execution of the script (`run_analysis.R`), you will also find in you working directory the following files and folders:

- `tidy.txt`: the tidy dataset generated by the script following the assignment guidelines;
- `getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`: the downloaded dataset;
- `/UCI HAR Dataset`: folder with the contents from the downloaded dataset;

## Assumptions

In order to execute the script and generate the tidy dataset, it is assumed that:
- You have a internet connection to download the dataset;
- You have R installed in your computer;
- You have the `dplyr` package installed;

## Instalation and Execution

Download the `run_analysis.R` script to your working directory and source it using the following command:

`source("run_analysis.R")`

After the execution, you will find the zip file with the dataset, the folder with the unziped dataset and the tidy.txt file in your working directory

## Background

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
  
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

(from the course assignment page)

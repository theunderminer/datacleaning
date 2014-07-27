# Creating a tidy data set

This file describes the creation and description of a tidy data set of accelerometers data from the Samsung Galaxy S smartphone ([Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones))

## run_analysis.R script

With the R-script [run_analysis.R](https://github.com/theunderminer/datacleaning/blob/master/run_analysis.R) it is possible to create a sumarized tidy data set of accelerometer data.
To run the script requires the extracted data set in the working directory. The working directory should contain the "UCI HAR Dataset" directory.
The comments in the scripts explain the commands. It consists of the following steps:

1. Reading the accelerometer measurements, activities and subjects from the training and test files.
2. Merging the traning and test data in one dataset
3. Reading and assigning the names of the measurements to the data set
4. Filter out only columns with mean() or std() in their names and the activity and subject columns.
5. Replace the activity codes with the names of the activities
6. Clean the column names: symbols like - ( and ) are removed.
7. Create an aggregated set where for each unique combination (180) of activity (6) and subject (30) the mean value of all other columns is calculated.
8. Store the tidy set to tidyset.txt

## Code Book

Each row in the tidy data set contains the mean value of the features for a unique combination of activity and subject. The values of the features are normalized and bounded within [-1,1].

1. activity: (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
2. subject: The number of the subject/the person that performed the activities.

The other features consist of the following structure:
(t|f)(bodyacc|grafityacc|bodyaccjerk|bodygyro|bodygyrojerk)(mean|std)(x|y|z)

* (t|f): t = time domain signal, f = frequency domain signal
* (bodyacc|grafityacc|bodyaccjerk|bodygyro|bodygyrojerk): accelerometer or gyroscope sensor
* (mean|std): mean = mean value, std = standard deviation
* (x|y|z): axis

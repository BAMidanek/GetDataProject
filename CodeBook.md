CodeBook
========================================================

This code book describes the contents of the dataset *"Mean.of.features.tidy.txt"* as well as the raw data inputs and transformation processes used to generate this tidy dataset. This dataset and related files were prepared for the course project for the Coursera course Getting & Cleaning Data. Ths code book contains four sections:

1. Description of Data
2. Data Dictionary
3. Description of Raw Data Inputs
4. Transformations and Other Processes

codebook.md is being used to give information specific to the output data only, which will of course have reference to information given on the input data. There will be no references to the run_analysis() code other than the function itself. All of the columns will be interpreted as variables (not to be confused with variables being the term I may have used for vectors and data frames in the code) and relevant details will be provided about each variable in order to properly interpret them.

## 1. Description of Data

*"Mean.of.features.tidy.txt"*, the output of run_analysis.R, is a tidy dataset containing the mean values of 86 measurement variables for each of the 180 unique combinations of subject ID and activity. This dataset is derived from the UCI HAR Dataset. The 86 measurement variables are a subset of the 561 feature variables contained in the raw data.

## 2. Data Dictionary

**Identity Variables**
- activities
 - The activity being performed by the subject. Factor Variable, 6 Levels; WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING
- sub.id
 - A number identifying the individual subject performing the given activity. Factor Variable, 30 Levels; 1-30L


**Accelerometer Time Signals**
- These variables represent the mean values of the mean and standard deviation of accelerometer readings accross all observations of each unique combination of subject ID and activity. The term "Acc" in the variable names indicates accelerometer readings. The accelerometer readings are collected as 3-axial raw signals, with "X", "Y", and "Z" each representing an axis. The acceleration signals are separated into body and gravity acceleration signals, denoted by the words "Body" and "Gravity" in the variable names. The body acceleration and angular velocity are then used to derive body jerk signals, indicated in the variable names by "Jerk". The "t" indicates that these are time domain signals (as opposed to frequency signals). The underlying values were normalized and bounded between -1 and 1. 

 - Avg.of.tBodyAcc.mean.X
 - Avg.of.tBodyAcc.mean.Y
 - Avg.of.tBodyAcc.mean.Z
 - Avg.of.tBodyAcc.std.X
 - Avg.of.tBodyAcc.std.Y
 - Avg.of.tBodyAcc.std.Z
 - Avg.of.tGravityAcc.mean.X
 - Avg.of.tGravityAcc.mean.Y
 - Avg.of.tGravityAcc.mean.Z
 - Avg.of.tGravityAcc.std.X
 - Avg.of.tGravityAcc.std.Y
 - Avg.of.tGravityAcc.std.Z
 - Avg.of.tBodyAccJerk.mean.X
 - Avg.of.tBodyAccJerk.mean.Y
 - Avg.of.tBodyAccJerk.mean.Z
 - Avg.of.tBodyAccJerk.std.X
 - Avg.of.tBodyAccJerk.std.Y
 - Avg.of.tBodyAccJerk.std.Z
 
 
**Gyroscope Time Signals**
- These variables represent the mean values of the mean and standard deviation of gyroscope readings accross all observations of each unique combination of subject ID and activity. The term "Gyro" in the variable names indicates gyroscope readings. The gyroscope readings are collected as 3-axial raw signals, with "X", "Y", and "Z" each representing an axis. The body acceleration and angular velocity are then used to derive body jerk signals, indicated in the variable names by "Jerk". The "t" indicates that these are time domain signals (as opposed to frequency signals). The underlying values were normalized and bounded between -1 and 1. 

 - Avg.of.tBodyGyro.mean.X
 - Avg.of.tBodyGyro.mean.Y
 - Avg.of.tBodyGyro.mean.Z
 - Avg.of.tBodyGyro.std.X
 - Avg.of.tBodyGyro.std.Y
 - Avg.of.tBodyGyro.std.Z
 - Avg.of.tBodyGyroJerk.mean.X
 - Avg.of.tBodyGyroJerk.mean.Y
 - Avg.of.tBodyGyroJerk.mean.Z
 - Avg.of.tBodyGyroJerk.std.X
 - Avg.of.tBodyGyroJerk.std.Y
 - Avg.of.tBodyGyroJerk.std.Z
 
 
**Magnitude of Accelerometer and Gyroscope Time Signals**
- These variables represent the mean values of the mean and standard deviation of the magnitude of three-dimensional signals from both the accelerometer and gyroscope accross all observations of each unique combination of subject ID and activity. These are calculated from the raw three-dimensional signals using the Euclidian norm. The underlying values were normalized and bounded between -1 and 1.
 
 - Avg.of.tBodyAccMag.mean..
 - Avg.of.tBodyAccMag.std..
 - Avg.of.tGravityAccMag.mean..
 - Avg.of.tGravityAccMag.std..
 - Avg.of.tBodyAccJerkMag.mean..
 - Avg.of.tBodyAccJerkMag.std..
 - Avg.of.tBodyGyroMag.mean..
 - Avg.of.tBodyGyroMag.std..
 - Avg.of.tBodyGyroJerkMag.mean..
 - Avg.of.tBodyGyroJerkMag.std..


**Frequency Domain Signals**
- These variables represent the mean values of the mean and standard deviation of accelerometer and gyroscope frequency signals accross all observations of each unique combination of subject ID and activity. The frequency signals are derived from the three-dimensional time signals using a Fast Fourier Transform. Frequency signals were calculated for Body Acceleration, Body Acceleration Jerk signals, and Body Gyro readings. Again, they are represented in three dimensions, "X", "Y", and "Z". In addition to the mean and standard deviation of the signals, the mean frequency is calculated, represented here by "meanFreq". The magnitude of these frequency signals is also calculated using the Euclidian norm. The underlying values were normalized and bounded between -1 and 1.

 - Avg.of.fBodyAcc.mean.X
 - Avg.of.fBodyAcc.mean.Y
 - Avg.of.fBodyAcc.mean.Z
 - Avg.of.fBodyAcc.std.X
 - Avg.of.fBodyAcc.std.Y
 - Avg.of.fBodyAcc.std.Z
 - Avg.of.fBodyAcc.meanFreq.X
 - Avg.of.fBodyAcc.meanFreq.Y
 - Avg.of.fBodyAcc.meanFreq.Z
 - Avg.of.fBodyAccJerk.mean.X
 - Avg.of.fBodyAccJerk.mean.Y
 - Avg.of.fBodyAccJerk.mean.Z
 - Avg.of.fBodyAccJerk.std.X
 - Avg.of.fBodyAccJerk.std.Y
 - Avg.of.fBodyAccJerk.std.Z
 - Avg.of.fBodyAccJerk.meanFreq.X
 - Avg.of.fBodyAccJerk.meanFreq.Y
 - Avg.of.fBodyAccJerk.meanFreq.Z
 - Avg.of.fBodyGyro.mean.X
 - Avg.of.fBodyGyro.mean.Y
 - Avg.of.fBodyGyro.mean.Z
 - Avg.of.fBodyGyro.std.X
 - Avg.of.fBodyGyro.std.Y
 - Avg.of.fBodyGyro.std.Z
 - Avg.of.fBodyGyro.meanFreq.X
 - Avg.of.fBodyGyro.meanFreq.Y
 - Avg.of.fBodyGyro.meanFreq.Z
 - Avg.of.fBodyAccMag.mean..
 - Avg.of.fBodyAccMag.std..
 - Avg.of.fBodyAccMag.meanFreq..
 - Avg.of.fBodyBodyAccJerkMag.mean..
 - Avg.of.fBodyBodyAccJerkMag.std..
 - Avg.of.fBodyBodyAccJerkMag.meanFreq..
 - Avg.of.fBodyBodyGyroMag.mean..
 - Avg.of.fBodyBodyGyroMag.std..
 - Avg.of.fBodyBodyGyroMag.meanFreq..
 - Avg.of.fBodyBodyGyroJerkMag.mean..
 - Avg.of.fBodyBodyGyroJerkMag.std..
 - Avg.of.fBodyBodyGyroJerkMag.meanFreq..

**Angle Variables**
- These variables represent the means of the angles between pairs of feature vectors accross all observations of each unique combination of subject ID and activity. In particular, these variables measure the angle between vectors of body feature signals and the mean of gravity acceleration signals accross all subjects. The underlying values were normalized and bounded between -1 and 1.
 - Avg.of.angle.tBodyAccMean.gravity.
 - Avg.of.angle.tBodyAccJerkMean..gravityMean.
 - Avg.of.angle.tBodyGyroMean.gravityMean.
 - Avg.of.angle.tBodyGyroJerkMean.gravityMean.
 - Avg.of.angle.X.gravityMean.
 - Avg.of.angle.Y.gravityMean.
 - Avg.of.angle.Z.gravityMean.


## 3. Description of Raw Data Inputs

The raw data inputs contained in the UCI HAR Dataset included:
- 'features.txt' - contained the names of all feature variables in the dataset
- 'activity_labels.txt' - contained the descriptive activity names that corresponded to the activity integer labels 
- 'train/X_train.txt' - contained all X variables (features) for the training dataset
- 'train/y_train.txt' - contained the Y variable (activities) for the training dataset
- 'test/X_test.txt' - contained all X variables (features) for the test dataset
- 'test/y_test.txt' - contained the Y variable (activities) for the test dataset
- 'train/subject_train.txt' - contained the subject IDs for the training dataset
- 'test/subject_test.txt' - contained the subject IDs for the test dataset


## 4. Transformations and Other Processes

The raw data files were listed above were combined and transformed by run_analysis.R to produce the output dataset *"Mean.of.features.tidy.txt"*.

First, the raw data files were read into R and assigned descriptive dataframe names. The first transformation was the combination of the test set X variables with the corresponding subject IDs and then with the corresponding Y variables:

      test.x <- cbind(test.subjects, test.x)
      test.comb <- cbind(test.y, test.x)

The same process was repeated with the training files:

      train.x <- cbind(train.subjects, train.x)
      train.comb <- cbind(train.y, train.x)

Next, the full training and test dataframes (including X variables, Y variables, and subject IDs) were combined to create the full master dataframe:

      full.comb <- rbind(train.comb, test.comb)

Integer activity labels were replaced with the descriptive activity names:

      levels(full.comb$activities) <- act.labels[1:6,2]

Next, a new dataframe was created by extracting variable names that contained mean and standard deviation measurements along with subject IDs and activity labels:

      tidy.data1 <- full.comb[, mn.sd.var.names]

Finally, this new dataframe was then melted and re-cast:

      melt <- melt(tidy.data1, id=c("activities", "sub.id"), measure.vars=mn.sd.var.names[3:88])
      tidy.data2 <- dcast(melt, activities + sub.id ~ variable, mean)

## Code book

This document describes the variables in the tidy data set and the processing steps to obtain it.

### The `run_analysis.R` does the following: 

#### 0. Prepares the data

_Note: The R packages required for the analysis are `data.table` and `plyr`_ 

* A new working directory is created, the data is directly downloaded and unzipped.

#### 1. Merges the training and the test sets to create one data set.

From the source data, the next sets are merged:

* `x_train.txt` and `x_test.txt`
* `y_train.txt` and `y_test.txt`
* `subject_train.txt` (train) and `subject_train.txt` (test)

Then, the three resulting sets were combined into a single data set.

#### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

The `features.txt` document is used to get the columns that have "mean()" and "std()" in their names, and create a subset with those columns.

#### 3. Uses descriptive activity names to name the activities in the data set

The `activity_labels.txt` document is used to replace the numbers to activity names.

#### 4. Appropriately labels the data set with descriptive variable names. 

Changed the formatting and cleaned the variable names to make them easier to read

#### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Created a tidy data set in a text file.


### Variable names:

#### ID variables:

* `subject`: Number assigned to each subject
* `activity`: Activity performed by the subject: "WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING"

#### Measurement variables

The measurements come from the accelerometer and gyroscope, by capturing 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

#### The original variable names were modified in the following way:

* Removed `\\()`
* Replaced `-mean` with `Mean`
* Replaced `-std` with `Std`
* Replaced `^t` with `time`
* Replaced `^f` with `frequency`
* Replaced `Acc` with `Acceletometer`
* Replaced `Gyro` with `Gyroscope`
* Replaced `Mag` with `Magnitude`
* Replaced `BodyBody` with `Body`


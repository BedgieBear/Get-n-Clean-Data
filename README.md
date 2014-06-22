Get-n-Clean-Data
================

Get and Clean Data programming assignment for Coursera

==================================================================

Original Data: 
==============

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record (observation), the following is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'train/subject_train.txt' & 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

Notes: 
======
- The file run_analysis.R in the main directory can be run as long as the Samsung data is in your working directory. 
- run_analysis collects, consolidates and cleans the data by performing the following:
-   1) reading the test and training subject files (subject_train.txt & /subject_test.txt) and combining them into one column with a header.
-   2a) reading the activity_labels.txt file, and cleaning up the activity description text. 
-   2b) reading the test and training y files (y_train.txt & y.test.txt), combining them into one column, creating a vector of activity descriptions that correspond to the activity codes in the y files, and combining the train and test activity descriptions into 1 column with a header.
-   3a) reading the features.txt file, extracting only the measurement headings on the mean and standard deviation for each observation, and cleaning up the measurement headings.
-   3b) reading the test and training X files (X_train.txt & X_test.txt), extracting only the measurements on the mean and standard deviation for each observation, and combining the train and test measurement data into a data frame with the headings created in 3a.
-   4) combining the subject data, activity data and measurement data into one data frame.
-   5) summarizing the data, such that the averages of all mean and standard deviation measurements for each unique subject/activity pair is provided in a tidy data frame. 
-   6) creating a text file, 'tidy_move_data.txt', from the tidy data frame.
- The output, 'tidy_move_data.txt', is a tidy data set giving the mean for all observations associated with a subject/activity pair. Here is a statement that will read the file:  xfiles <- read.table("tidy_move_data.txt", sep="\t"). 

- For more information about this dataset contact: activityrecognition@smartlab.ws
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


Input Features 
==============

The features selected for the database input to the run_analysis processcome from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

-tBodyAcc-XYZ  
-tGravityAcc-XYZ  
-tBodyAccJerk-XYZ  
-tBodyGyro-XYZ  
-tBodyGyroJerk-XYZ  
-tBodyAccMag  
-tGravityAccMag  
-tBodyAccJerkMag  
-tBodyGyroMag  
-tBodyGyroJerkMag  
-fBodyAcc-XYZ  
-fBodyAccJerk-XYZ  
-fBodyGyro-XYZ  
-fBodyAccMag  
-fBodyAccJerkMag  
-fBodyGyroMag  
-fBodyGyroJerkMag  

The set of variables that were estimated from these signals are: 

-mean(): Mean value  
-std(): Standard deviation  
-mad(): Median absolute deviation   
-max(): Largest value in array  
-min(): Smallest value in array  
-sma(): Signal magnitude area  
-energy(): Energy measure. Sum of the squares divided by the number of values.   
-iqr(): Interquartile range   
-entropy(): Signal entropy 
-arCoeff(): Autorregresion coefficients with Burg order equal to 4  
-correlation(): correlation coefficient between two signals  
-maxInds(): index of the frequency component with largest magnitude  
-meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
-skewness(): skewness of the frequency domain signal  
-kurtosis(): kurtosis of the frequency domain signal   
-bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
-angle(): Angle between to vectors.  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

-gravityMean  
-tBodyAccMean 
-tBodyAccJerkMean 
-tBodyGyroMean  
-tBodyGyroJerkMean  


run_analysis processing 
=======================

Using data collected from the accelerometers on Samsung Galaxy S smartphones create a script, run_analysis.R to do the following.   
         1) Merge the training and the test sets to create one data set.  
         2) Extract only the measurements on the mean and standard deviation for each
            measurement.   
         3) Use descriptive activity names to name the activities in the data set.  
         4) Appropriately label the data set with descriptive variable names.   
         5) Create a second, independent tidy data set with the average of each variable
            for each activity and each subject.  

In more detail, the process is:          
         1) Read in 6 files unzipped from the source dataset: test subject, test activity code, test measurements, 	 training subject, training activity code, training, measurments, activity code & description, and measurement 	 headers.    
         2) Process subject data:  
		2a) Combine the test and training subject data and add a heading.  
       	 3) Process activity data:  
		3a) Isolate the description text by splitting off the preceding number.  
         	3b) Clean up the description by putting in lower case and removing the '_' characters.  
         	3c) Replace the activity code with the activity description for each observation.   
		3d) Combine the test and training activity data and add a heading.  
	 4) Process measurement data:		  
         	4a) Extract only the measurements on the mean and standard deviation for each observation. Identify these 		based on the field name.  
		4b) Select only the measurement headings that will be needed.  
		4c) Isolate the heading text by splitting off the preceding number.  
         	4d) Clean up the heading by putting in lower case, removing the '-' characters, removing the parentheses, 		and making the names slightly more descriptive.  
		4e) Using the same guidelines as were used in selecting the measurement headings, select the mean and 		standard deviation measurements for each observation.   
		4f) Combine the test and training measurement data and add the headings.  
	 5) Combine all the information into one data frame.  
		5a) Combine the subject, activity, and measurement data into 1 data frame. Each subject has 6 activities. 		Each subject/activity observation has 66 mean and standard deviation measurements.  
		5b) Reshape the data so that the mean is calculated for all observations associated with a 		subject/activity pair.  
	 6) Write the resulting data frame as a tidy data set, tidy_move_data.txt.  


Output Averages Dataset (tidy_move_data.txt) Fields 
===================================================

-subject:  Integer that identifies the subject. Values are 1 to 30.  
-activity: Description on the activity measured. Values are walking, walking upstairs, walking downstairs, sitting, standing, laying.    

The following 66 fields are the averages of all measurements for each subject/activity pair. The names consist of a number of parts, which identify the type of measurement.     
	- avg:  avg of all readings of this type for this subject/activity pair  
        - freq:    frequency  
        - time:    time  
	- body:    body  
	- gravity: gravity  
        - gyro:    gyroscope   
        - jerk:    jerk  
        - std:     standard deviation  
        - mean:    mean/average  
        - acc:     acceleration  
        - mag:     signal magnitude  
        - x, y, z: 3-axial signals in the x, y and z directions  


-avgtimebodyaccmeanx  
-avgtimebodyaccmeany  
-avgtimebodyaccmeanz 
-avgtimebodyaccstdx  
-avgtimebodyaccstdy  
-avgtimebodyaccstdz  
-avgtimegravityaccmean  
-avgtimegravityaccmeany  
-avgtimegravityaccmeanz  
-avgtimegravityaccstdx  
-avgtimegravityaccstdy  
-avgtimegravityaccstdz  
-avgtimebodyaccjerkmeanx  
-avgtimebodyaccjerkmeany 
-avgtimebodyaccjerkmeanz  
-avgtimebodyaccjerkstdx  
-avgtimebodyaccjerkstdy   
-avgtimebodyaccjerkstdz  
-avgtimebodygyromeanx  
-avgtimebodygyromeany  
-avgtimebodygyromeanz  
-avgtimebodygyrostdx    
-avgtimebodygyrostdy  
-avgtimebodygyrostdz  
-avgtimebodygyrojerkmeanx  
-avgtimebodygyrojerkmeany  
-avgtimebodygyrojerkmeanz  
-avgtimebodygyrojerkstdx  
-avgtimebodygyrojerkstdy  
-avgtimebodygyrojerkstdz  
-avgtimebodyaccmagmean  
-avgtimebodyaccmagstd  
-avgtimegravityaccmagmean    
-avgtimegravityaccmagstd  
-avgtimebodyaccjerkmagmean  
-avgtimebodyaccjerkmagstd  
-avgtimebodygyromagmean  
-avgtimebodygyromagstd  
-avgtimebodygyrojerkmagmean  
-avgtimebodygyrojerkmagstd  
-avgfreqbodyaccmeanx  
-avgfreqbodyaccmeany  
-avgfreqbodyaccmeanz  
-avgfreqbodyaccstdx  
-avgfreqbodyaccstdy  
-avgfreqbodyaccstdz  
-avgfreqbodyaccjerkmeanx  
-avgfreqbodyaccjerkmeany  
-avgfreqbodyaccjerkmeanz  
-avgfreqbodyaccjerkstdx  
-avgfreqbodyaccjerkstdy  
-avgfreqbodyaccjerkstdz  
-avgfreqbodygyromeanx  
-avgfreqbodygyromeany  
-avgfreqbodygyromeanz  
-avgfreqbodygyrostdx  
-avgfreqbodygyrostdy  
-avgfreqbodygyrostdz  
-avgfreqbodyaccmagmean  
-avgfreqbodyaccmagstd  
-avgfreqbodybodyaccjerkmagmean  
-avgfreqbodybodyaccjerkmagstd  
-avgfreqbodybodygyromagmean  
-avgfreqbodybodygyromagstd  
-avgfreqbodybodygyrojerkmagmean  
-avgfreqbodybodygyrojerkmagstd  
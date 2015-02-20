### Description of experiment and data file, TidyData.txt
This is the data from the experiments using smartphones to recognize human activity.The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experiments captured 3-axial (X, Y, Z) linear acceleration and 3-axial (X, Y, Z) angular velocity at a constant rate of 50Hz. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
 

- Subject - the identifier of the subject who carried out the experiment.
- Activity - activity label 
- mean - average of the the measure
- std - standard deviatio of the measure
- XYZ - denote 3-axial signals in the X, Y and Z directions
- tBodyAcc: body acceleration signals
- tGravityAcc: gravity acceleration signals
- tBodyAccJerk: Jerk signals for body acceleration
- tBodyGyro: body gyroscope signals
- tBodyGyroJerk: Jerk singals for body gyroscope
- tBodyAccMag: magnitude of body acceleration signals
- tGravityAccMag: magnitude of gravity acceleration signals
- tBodyAccJerkMag: magnitude of Jerk signals for body acceleration
- tBodyGyroMag: magnitude of body gyroscope signals
- tBodyGyroJerkMag: magnitude of Jerk signals for body gyroscope
- fBodyAcc: Fast Fourier Transform of body acceleration signals
- fBodyAccJerk: Fast Fourier Transform of Jerk signals for body acceleration
- fBodyGyro: Fast Fourier Transform of body gyroscope signals
- fBodyAccMag: Fast Fourier Transform of magnitude of body acceleration signals
- fBodyAccJerkMag: Fast Fourier Transform of magnitude of Jerk signals for body acceleration
- fBodyGyroMag: Fast Fourier Transform of magnitude of body gyroscope signals
- fBodyGyroJerkMag: Fast Fourier Transform of magnitude of Jerk signals for body gyroscope
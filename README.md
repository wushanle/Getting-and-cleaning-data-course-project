## Description of experiment
The experiments use smartphones to recognize human activity.The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experiments captured 3-axial (X, Y, Z) linear acceleration and 3-axial (X, Y, Z) angular velocity at a constant rate of 50Hz. 

### Original dataset
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The dataset includes the following files:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'X_train.txt': Training set.
- 'y_train.txt': Training labels.
- 'X_test.txt': Test set.
- 'y_test.txt': Test labels.


## Purpose of this work

### Clean the original dataset using R code

The R code reads in the original data set, merges the test and train data and produce the tidy data set. For more details, please refer to run_analysis.R.

### Tidy data set
The output of R code is tidy data set saved in TidyData.txt For more details on the tidy data set, please refer to the CodeBook.md.



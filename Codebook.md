# Human Activity Recognition using Smartphones
## Codebook for the JHU Coursera dataset
This codebook builds on the codebook for Human Activity Recognition Using Smartphones
Dataset Version 1.0. It describes the changes to data carried out to go from the dataset
originally published under that name to a CSV dataset that is produced programmatically
by the run_Analysis.R script. The variations to the codebook are treated first, then the original
codebook is reported. 

## Variations to the data and layout.
This section deals with any changes to variables and relational layout carried out in run_Analysis.R. Three changes are made:

1. *Merging datasets.* The script merges X\_train.txt, X\_test.txt, y\_train.txt, y\_test.txt,
subject\_train.txt, subject\_test.txt into a single dataframe,which is then written to a CSV
file. In the resulting file the observations from 1 to 2947 are from the test database, those
from 2948 to 10299 are from the train database.

2. *Adding descriptive activity names.* A column is added to the dataframe (prior to writing to 
CSV) named activity.desc, which contains a description of the activity, based on the correspon-
dences set out in activity_labels.txt.

3. *Naming columns.* Drawing from the features.txt file, descriptive names are given to the 
561 measurement variables contained in X_test.txt and X_train.txt. Instances of homonymy (columns 
with same name) due to the data being triaxial, are resolved by adding a ".n"" at the end of the
variable name where n = 1,2,3 assigned in ascending order.

The sources for the different sectors of the dataframe are summarised in the diagram below.
The header row reports the actual headers in the dataframe. The OBS rows report the txt
sources for the data  


| _[HEADER ROW]_| subject       | activity| activity.desc | 561 descriptive variable names....|  
|-------------|---------------|---------|---------------|-----------------------------------|  
|_[OBS 1-2948]_ | subject_test.txt  | y_test.txt  | [new variable]| X_test.txt  |
|_[OBS 2949-10299]_  | subject_train.txt | y_train.txt | [new variable]| X_train.txt |

No units are changed at any point of the merging operations. No further transformation is carried out on the merged dataset.

An independent dataset, dataset2, is created by extracting means of measurements by combinations of activity and subject. This is output to a txt file, dataset2.txt. The data in this dataset has the structure illustrated in the following table

| _[HEADER ROW]_| subject       | activity.desc | 561 descriptive variable names....|  
|-------------|---------------|---------------|-----------------------------------|  
|_[OBS 1-180]_ | subject_test.txt  | [new variable] | [means of respective measurement variables by subject and activity]  |


##Original code book

Human Activity Recognition Using Smartphones Dataset  
Version 1.0

==================================================================

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Universit‡ degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws

==================================================================


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

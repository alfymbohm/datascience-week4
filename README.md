# README file for the Getting and Cleaning Data Coursera course project

## Structure of the repo
This README file details the functioning and structure of this Getting and Cleaning Data project repo. The repo contains:
- run_Analysis.R: the key R script, which reads, merges and restructures the dataset from Reyes-Ortiz et al. (2012) "Human Activity Recognition Using Smartphones Dataset"
- README.md this file.
- Codebook.md: a file detailing the modifications to the dataset
- dataset2.txt: an output of the script
- a data folder, containing
    - activity_labels.txt: a file containing the mapping from activity categorical markers to descriptions of activities (e.g. WALKING etc.)
    - merged-dataset.csv: the merged dataset, as output by run_Analysis.R
    - README.txt the original readme from the Reyes-Ortiz et al. paper
    - test and train directories containing data from Reyes-Ortiz et al.
    
## Purpose of the repo
The repo demonstrates a script that can merge datasets, writing the resulting dataset on a CSV file; dump R objects drawn from those datasets in a file; and create a derivative dataset based on calculations from the original one. 

All the action happens in the script called run_Analysis.R. This requires a certain file structure to be present around the script and will issue warnings if it is not present. Basically, all you need to do is run run_Analysis.R from your working directory and expand the data from Reyes-Ortiz et al. to a subdirectory of your working directory called "data".   
You can find the data from Reyes-Ortiz et al here<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.

The script is commented to show what each part of the code does. It executes all the steps listed in the Getting and Cleaning Data Course project instructions page, albeit in different order. The means and standard deviations are extracted and then dumped in an R object. The variables are renamed descriptively, eliminating duplicate names, so that each column has a unique name (a principle of tidy datasets). The activity variable is transformed (but preserved) into an activity.desc variable that has descriptive values. The required independent dataset with means for measurements by activity and subject is created using a for loop and output to a txt file named dataset.txt.
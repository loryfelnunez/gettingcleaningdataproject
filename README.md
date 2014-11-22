gettingcleaningdataproject
==========================

Course Project for Getting and Cleaning Data Course

###Data for this project is from: 

DATA FILE: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

To replicate: 

1. Make a folder in your local R directory called ProjectData. 

2. Download DATA FILE (see link above)

3. Unzip DATA FILE in ProjectData directory.
4. Make sure your paths correspond.  
    a. ProjectData should be the top level directory with the following files:
activity_labels.txt, features.txt, features_info.txt, README.txt<br/>
    b. ProjectData should have the test and train subfolders<br/>
c. test subfolder should have the following files and subfolder:<br/>
subject_test.txt, X_test.txt, y_test.txt and the Inertial Signals subfolder<br/>
d. train subfolder should have the following files and subfolder: <br/>
subject_train.txt, X_train.txt, y_train.txt and the Inertial Signals subfolder<br/>
e. The Inertial Signals subfolders in both the test and train folders are not used.<br/>
<br/>

###Running the script:

1. Make sure the Project Data directory is in your R present working directory.

2. Run the script run_analysis.R

3. The output tidy data should be written in the current working directory as projectOutputData.txt.  
4. The run_analysis.R script will display the file for you in RStudio via the view command.

###Tidy Data

As per http://vita.had.co.nz/papers/tidy-data.pdf page 4, tidy data has the following components

#####1. Each variable forms a column.

- In this tidy data set, column represents a variable.  A variable is the average of the
mean or standard deviation of features with mean() or std() in the column name.  
Other types of mean(ex. meanFreq()) were not included.

#####2. Each observation forms a row.
- Each observation consists of the measurements of the subject while doing a 
specific activity.  This observation is in one row.

#####3. Each type of observational unit forms a table
- The whole table forms an observational unit grouped by subject and activity.




######################################################################
#Step 1: Merges the training and the test sets to create one data set.
######################################################################
#load DATA common to TRAIN and TEST set
#Note: added stringsAsFactors to append "Subject" and "Activity" to features
features <- read.table("ProjectData/features.txt", header=FALSE, stringsAsFactors=FALSE)
activity_labels <- read.table("ProjectData/activity_labels.txt", header=FALSE)
#load TEST DATA
subject_test <- read.table("ProjectData/test/subject_test.txt", header=FALSE)
xtest <- read.table("ProjectData/test/X_test.txt", header=FALSE)
ytest <- read.table("ProjectData/test/y_test.txt", header=FALSE)
testData <- cbind(xtest,subject_test)
testData <- cbind(testData, ytest)
#load TRAIN DATA
subject_train <- read.table("ProjectData/train/subject_train.txt", header=FALSE)
xtrain <- read.table("ProjectData/train/X_train.txt", header=FALSE)
ytrain <- read.table("ProjectData/train/y_train.txt", header=FALSE)
trainData <- cbind(xtrain,subject_train)
trainData <- cbind(trainData, ytrain)
#combine TEST and TRAIN Data
data <- rbind(testData, trainData)

################################################################################################
#Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
#Only columns with mean() and std() where used
################################################################################################
#create the vector for column names -- Step 4, below
columns <- c(features[[2]], "Subject", "Activity")
#put column names to the data
colnames(data) <- columns
#prune the columns, retain columns with mean and sd
data <- data[,grepl("mean\\(\\)|std\\(\\)|Activity|Subject", names(data))]

###############################################################################
#Step 3: Uses descriptive activity names to name the activities in the data set
################################################################################
#convert Y to activity labels
data$Activity <- factor(data$Activity, labels = c("WALKING", "WALKING_UP", "WALKING_DOWN", "SITTING", "STANDING", "LAYING"))

###########################################################################
#Step 4: Appropriately labels the data set with descriptive variable names.
#Note: Lines 29, 57, 58 and 59 address this step
###########################################################################

##################################################################################
#Step 5: From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
##################################################################################

# get the average for all columns
newData <- aggregate(data, by=list(data$Subject, data$Activity), FUN=mean)
# remove the Subject and Activity columns that were inadvetently calculated by aggregate
newData <- subset(newData, select = -c(Subject, Activity))

#make the column names more descriptive -- Step 4
colnames(newData)[colnames(newData)=="Group.1"] <- "Subject"
colnames(newData)[colnames(newData)=="Group.2"] <- "Activity"
colnames(newData) <- sub("()", "", colnames(newData), ignore.case =FALSE, fixed=TRUE)

##############################
# RESULT should be in newData
##############################

write.table(newData, "projectOutputData.txt", row.name=FALSE)

#to view txt file credits to David's project FAQ
resultdata <- read.table("projectOutputData.txt", header = TRUE)
View(resultdata)




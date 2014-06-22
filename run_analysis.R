#Load the libraries that will be required later.
library(utils)
library(reshape2)

#Check if the UCI HAR Dataset zip file has already been downloaded. If it has not been downloaded, download the file and save it to your working directory. 
if(!file.exists("./getdata-projectfiles-UCI HAR Dataset.zip")) {
      file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(file.url, destfile="./getdata-projectfiles-UCI HAR Dataset.zip")
} else {print("File has already been downloaded.")}

#Check if UCI HAR Dataset zip file has already been unzipped. If it has not been unzipped, unzip the file.
if(!file.exists("./UCI HAR Dataset")){
      unzip("./getdata-projectfiles-UCI HAR Dataset.zip")
} else {print("File has already been unzipped")}

#Read features.txt, which contains the feature names. Use the make.names() function to convert the feature names in column 2 into variable names that R can read. Use gsub() to replace "..." in factor names with "."
features <- read.table("./UCI HAR Dataset/features.txt")
feat.names <- make.names(as.character(features[,2]), unique=TRUE)
feat.names <- gsub("...", ".", feat.names, fixed=TRUE)

#Read activity_labels.txt, which contains the descriptive activity names that correspond to the activity codes used as the Y variable in the test and training datasets.
act.labels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("act.code", "activities"), colClasses="factor")

#Read in the test datasets: y_test.txt contains the activity codes (Y variables) for the test dataset; x_test.txt contains the features (X variables); subject_test.txt contains the subject id's that correspond to the observations in the test dataset. Add the subject id's to the x dataset. Add the Y variables to the x dataset.
test.y <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names="activities", colClasses="factor")
test.x <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=feat.names)   
test.subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="sub.id", colClasses="factor")
test.x <- cbind(test.subjects, test.x)
test.comb <- cbind(test.y, test.x)

#Read in the training datasets: y_train.txt contains the activity codes (Y variables) for the training dataset; x_train.txt contains the features (X variables); subject_train.txt contains the subject id's that correspond to the observations in the training dataset. Add the subject id's to the x dataset. Add the Y variables to the x dataset.
train.y <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names="activities", colClasses="factor")
train.x <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=feat.names)   
train.subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="sub.id", colClasses="factor")
train.x <- cbind(train.subjects, train.x)
train.comb <- cbind(train.y, train.x)

#Combine the training and test datasets.
full.comb <- rbind(train.comb, test.comb)

#Replace the activity codes with the descriptive activity labels.      
levels(full.comb$activities) <- act.labels[1:6,2]     

#Create a logical statement that returns TRUE if a variable name includes "mean" or "std." Identify the feature variables for which this logical statement is TRUE. Extract these variables along with the variables identifying the subject and activity to create a new dataset (tiny.data1).
mn.sd.logical <- grepl("Mean", names(full.comb), ignore.case=TRUE) | grepl(".std", names(full.comb), fixed=TRUE)
mn.sd.var.names <- c("activities", "sub.id", names(full.comb)[mn.sd.logical])
tidy.data1 <- full.comb[, mn.sd.var.names]

#Melt this tidy dataset so that the rows contain subject id and activity and the columns contain the feature variables identified above. Re-cast this dataset so that the rows contain every unique combination of subject id and activity and the columns contain the means of the feature variables that correspond to each subject/activity combination. Re-order the dataset in ascending order by activity name and subject id. Modify feature variable names so that they clearly indicate the values are means of original feature variables.
melt <- melt(tidy.data1, id=c("activities", "sub.id"), measure.vars=mn.sd.var.names[3:88])
tidy.data2 <- dcast(melt, activities + sub.id ~ variable, mean)
tidy.data2$sub.id <- as.integer(tidy.data2$sub.id)
tidy.data2 <- tidy.data2[order(tidy.data2$activities, tidy.data2$sub.id),]
tidy.data2$sub.id <- as.factor(tidy.data2$sub.id)
colnames(tidy.data2)[3:88] <- paste("Avg.of.", colnames(tidy.data2)[3:88], sep="")

#Write this data frame to a .txt file saved in your working directory.
write.table(tidy.data2, "Mean.of.features.tidy.txt", row.names=FALSE)

{
        ## Getting and Cleaning Data course project
        ## Using data collected from the accelerometers on Samsung Galaxy S smartphones  
        ## create one R script called run_analysis.R that does the following. 
        ## 1) Merge the training and the test sets to create one data set.
        ## 2) Extract only the measurements on the mean and standard deviation for each
        ##    measurement. 
        ## 3) Use descriptive activity names to name the activities in the data set
        ## 4) Appropriately label the data set with descriptive variable names. 
        ## 5) Create a second, independent tidy data set with the average of each variable
        ##    for each activity and each subject.
        
        
        ## Read in 6 files: test subject, test activity code, test measurements, training subject,
        ## training activity code, training, measurments, activity code & description, and
        ## measurement headers. 
        
subtest <- read.table("subject_test.txt", sep="\t")   
ytest <- read.table("y_test.txt", sep="\t")
Xtest <- read.table("X_test.txt", sep="", fill = TRUE)

subtrain <- read.table("subject_train.txt", sep="\t")   
ytrain <- read.table("y_train.txt", sep="\t")
Xtrain <- read.table("X_train.txt", sep="", fill = TRUE)

actlabels <- read.table("activity_labels.txt", sep="\t")
features <- read.table("features.txt", sep="\t")

        ## combine the test and training subject data and add a heading.

subdata <- rbind(subtest, subtrain)
colnames(subdata) <- c("subject")

        
        ## Isolate the description text by splitting off the preceding number.
        ## Clean up the description by putting in lower case and removing the '_' characters.

testacts <- vector(mode = "character", length = 0)
trainacts <- vector(mode = "character", length = 0)
actlabelschar <- as.character(actlabels$V1)
activities <- strsplit(actlabelschar, " ")
secondelement <- function(x) {x[2]}
actlabs1 <- sapply(activities, secondelement)
actlabs2 <- tolower(actlabs1)
actlabs3 <- gsub("_", " ", actlabs2, )

        ## Replace the activity code with the activity description for each observation. 

ytest_cnt <- nrow(ytest)
ytrain_cnt <- nrow(ytrain)

for (i in 1:ytest_cnt) {
        testacts <- c(testacts, actlabs3[ytest$V1[i]]) 
}
for (i in 1:ytrain_cnt) {
        trainacts <- c(trainacts, actlabs3[ytrain$V1[i]]) 
}

        ## combine the test and training activity data and add a heading.

actdata <- data.frame(c(testacts, trainacts))
colnames(actdata) <- c("activity")

        ## Extract only the measurements on the mean and standard deviation for
        ## each observation.

        ## Select only the measurement headings that will be needed.

meancols <- grep("\\-mean\\(\\)", features$V1)
stdcols <- grep("-std\\(\\)", features$V1)
headindex <- sort(c(meancols, stdcols))
headings <- as.vector(features$V1[headindex])

        ## Isolate the heading text by splitting off the preceding number.
        ## Clean up the heading by putting in lower case, removing the '-' characters,
        ## and removing the parentheses.

meashead <- strsplit(headings, " ")
meashead1 <- sapply(meashead, secondelement)
meashead2 <- tolower(meashead1)
meashead3 <- gsub("-", "", meashead2)
meashead4 <- gsub("fbod", "avgfreqbod", meashead3)
meashead5 <- gsub("tbod", "avgtimebod", meashead4)
meashead6 <- gsub("tgra", "avgtimegra", meashead5)
finalmeashead <- gsub("\\(\\)", "", meashead6)
        
        ## Use the previously defined headindex to select the mean and standard deviation
        ## measurements for each observation. 

Xtestcols <- Xtest[, headindex]
Xtraincols <- Xtrain[, headindex]

        ## combine the test and training measurement data and add the headings.

measdata <- rbind(Xtestcols, Xtraincols)
colnames(measdata) <- finalmeashead

        ## combine the subject, activity, and measurement data into 1 data frame.
        ## Each subject had 6 activities.
        ## Each subject/activity observation has 66 mean and standard deviation measurements.

movedata <- cbind(subdata, actdata, measdata) 

        ## Load reshape2 so that the melt function is available.
        ## Reshape the data so that the mean is calculated for all observations associated
        ## with a subject/activity pair.

library(reshape2) 

movemelt <- melt(movedata,id=c("subject","activity"), measure.vars=finalmeashead)
tidymovedata <- dcast(movemelt, subject + activity ~ variable, mean)

        ## Write the resulting data table as a tidy data set.

write.table(tidymovedata, file = "tidy_move_data.txt", sep="\t") 
}
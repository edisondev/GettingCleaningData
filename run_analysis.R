##git commit -m 'initial file addition'
##git push origin master

#IMport libraries
library(dplyr)

#main code

labels=read.table("UCI HAR Dataset\\features.txt",stringsAsFactors=FALSE)

#   "Merges the training and the test sets to create one data set.      "
#   "Appropriately labels the data set with descriptive variable names.  "

##Load Testing data
foldertest="UCI HAR Dataset\\test\\"
filestest="X_test.txt"##dir(foldertest)
subj_file_test="subject_test.txt"
activity_file_test="y_test.txt"

#read table and name columns
DTtest=read.table(paste0(foldertest,filestest), 
                  header=FALSE,stringsAsFactors=FALSE,
                  col.names=labels$V2)

#Load activity labels and change them to factors
DTtest_act=read.table(paste0(foldertest,activity_file_test), 
                      header=FALSE,stringsAsFactors=FALSE,
                      col.names="activity")


#Load the subject test data
DTtest_subj=read.table(paste0(foldertest,subj_file_test), 
                       header=FALSE,stringsAsFactors=FALSE,
                       col.names="subject")

##Merge the full test data
testdata=cbind( cbind(DTtest_subj,DTtest_act) , DTtest)

#clean up unused variables (to free memory on slower machines)
rm(DTtest_act, DTtest_subj, DTtest)


##Load Training data
foldertrain="UCI HAR Dataset\\train\\"
filestrain="X_train.txt"
subj_file_train="subject_train.txt"
activity_file_train="y_train.txt"

#read table and name columns
DTtrain=read.table(paste0(foldertrain,filestrain), 
                  header=FALSE,stringsAsFactors=FALSE,
                  col.names=labels$V2)

#Load activity labels and change them to factors
DTtrain_act=read.table(paste0(foldertrain,activity_file_train), 
                      header=FALSE,stringsAsFactors=FALSE,
                      col.names="activity")


#Load the subject test data
DTtrain_subj=read.table(paste0(foldertrain,subj_file_train), 
                       header=FALSE,stringsAsFactors=FALSE,
                       col.names="subject")

##Merge the full test data
traindata=cbind( cbind(DTtrain_subj,DTtrain_act) , DTtrain)

#clean up unused variables (to free memory on slower machines)
rm(DTtrain_act, DTtrain_subj, DTtrain)

# Merge the train and test data
fulldata=rbind(testdata,traindata)

#clean up temporary variables
rm(testdata,traindata)

#   "Extracts only the measurements on the mean and standard deviation for each measurement."
#find all the indeces of labels that contain mean or Mean or std
mainind=grepl("mean", tolower(labels$V2)) | grepl("std", tolower(labels$V2)) 

#select only the columns we want
fulldata<-fulldata[,mainind]

#   "Uses descriptive activity names to name the activities in the data set"
#change activity column to factor
fulldata$activity=as.factor(fulldata$activity)

#rename factor levels
levels(fulldata$activity)=c("walking", "walking_upstairs", "walking_downstairs", "sitting","standing","laying")


#create factor combination of acitivty and subject
levels=interaction(fulldata$subject,fulldata$activity)
##append the levels to the data
fulldata=cbind(fulldata,levels)
#Did not finish mean computing

#export tidy dataset as a .txt file
write.table(file="tidy_data.txt",fulldata, row.name=FALSE)



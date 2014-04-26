# load all files assuming files exists in current directory
combine_and_tidyup_data  <- function(){
  
  library(data.table)
  # load initial data
  inputFeaturesTest <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
  outpuTest <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
  subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
  inputFeatureTrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
  outputTrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
  subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
  
  # attach lables to activity
  activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
  outpuTest$V1 <- factor(outpuTest$V1,levels=activities$V1,labels=activities$V2)
  outputTrain$V1 <- factor(outputTrain$V1,levels=activities$V1,labels=activities$V2)
  
  # now attach col names to all input and output
  features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")
  colnames(inputFeaturesTest)<-features$V2
  colnames(inputFeatureTrain)<-features$V2
  colnames(outpuTest)<-c("Activity")
  colnames(outputTrain)<-c("Activity")
  colnames(subjectTest)<-c("Subject")
  colnames(subjectTrain)<-c("Subject")
  
  # combine both test and train data
  inputFeaturesTest<-cbind(inputFeaturesTest,outpuTest)
  inputFeaturesTest<-cbind(inputFeaturesTest,subjectTest)
  inputFeatureTrain<-cbind(inputFeatureTrain,outputTrain)
  inputFeatureTrain<-cbind(inputFeatureTrain,subjectTrain)
  combinedData<-rbind(inputFeaturesTest,inputFeatureTrain)
  
  #  mean & standard deviation for each measurement
  combinedDataMean <-sapply(combinedData,mean,na.rm=TRUE)
  combinedDataStd <-sapply(combinedData,sd,na.rm=TRUE)
  
  # write data to a csv
  write.csv(combinedDataMean,"combinedMean.csv")
  write.csv(combinedDataStd,"combinedStd.csv")
  
  # final Tidy data set
  DT <- data.table(combinedData)
  tidyData <- DT[,lapply(.SD,mean),by="Activity,Subject"]
  
  # write data to a csv
  write.csv(tidyData,"tidyData.csv")
    
}
run_analysis <- function()
{

 
  
  if (!file.exists("data"))
  { dir.create("data")}

  if (!file.exists("./data/UCI HAR Dataset.zip"))
  {
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  download.file(fileurl,destfile = "./data/UCI HAR Dataset.zip")
  unzip("./data/UCI HAR Dataset.zip",exdir = "./data")
  
  }
  
  list.files("./data/UCI HAR Dataset/train")
  list.files("./data/UCI HAR Dataset/test")
  
  #Data set for complere feature descriptions
  feature <- read.table("./data/UCI HAR Dataset/features.txt",header=FALSE,stringsAsFactors = FALSE)
  features <- feature[,2]
  features <- gsub('[()]','',features)  #replacing () from headers
  
  #Data set for activity_code descriptions
  ac_levels <- read.table("./data/UCI HAR Dataset/activity_labels.txt",header=FALSE,stringsAsFactors = FALSE)
  names(ac_levels) <- c("ActivityID","ActivityDesc")
  
  #Training Sets
  tr_levels <- read.table("./data/UCI HAR Dataset/train/y_train.txt",header=FALSE)
  tr_sets <- read.table("./data/UCI HAR Dataset/train/x_train.txt",header=FALSE)
  tr_subject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",header=FALSE)
  
  #Test Sets
  test_levels <- read.table("./data/UCI HAR Dataset/test/y_test.txt",header=FALSE)
  test_sets <- read.table("./data/UCI HAR Dataset/test/x_test.txt",header=FALSE)
  test_subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",header=FALSE)
  
  #COmbining Training and Test Sets
  comb_levels <- rbind(tr_levels,test_levels)
  comb_sets <- rbind(tr_sets,test_sets)
  comb_subject <- rbind(tr_subject,test_subject)
  
  #Comining subject,Activity level and  sets together
  dat <- cbind(comb_subject,comb_levels,comb_sets)
  names(dat) <- c("Subject","ActivityID",features)
  dim(dat)  #10299   563
  
  #measurements with the mean and standard deviation 
  req_features <- grep("*.mean.*|*.std.*",features,value = TRUE)
  length(req_features)  #79
  
  #Subset the columns with only the required features
  dat_reqd <- dat[,c("Subject","ActivityID",req_features)]
  dim(dat_reqd)  #10299    81
  
  #Creating Second Independent dataset with the average of each variable for each activity and each subject.
  indp_tidy_dset <- aggregate(.~ Subject + ActivityID,dat_reqd,FUN=mean)
  indp_tidy_dset <- merge(indp_tidy_dset,ac_levels,by="ActivityID" )
  indp_tidy_dset <- indp_tidy_dset[order(indp_tidy_dset$Subject,indp_tidy_dset$ActivityID),]
  
  #Writing the output file
  write.table(indp_tidy_dset,"./data/indp_tidy_dset.txt",row.names = FALSE)
}
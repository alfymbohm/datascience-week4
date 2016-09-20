# Week 4 Project
## Setup

dirpaths<-c("data","data/train","data/test")
rootfilepaths<-c("README.md","Codebook.md","data")
datafilepaths<-c("activity_labels.txt","test","README.txt","features.txt","train","features_info.txt")
testfilepaths<-c("data/test/subject_test.txt", "data/test/X_test.txt","data/test/y_test.txt")
trainfilepaths<-c("data/train/subject_train.txt", "data/train/X_train.txt","data/train/y_train.txt")

if (!all(sapply(dirpaths,dir.exists))) {warning("Necessary directories not set up")} else {print("Directories ok")}
if (!all(sapply(rootfilepaths,file.exists)))  {warning("Necessary root directory files not present")} else {print("Root files ok")}  
if (!all(sapply(datafilepaths,file.exists)))  {warning("Necessary data directory files not present")} else {print("Data files ok")}  
if (!all(sapply(testfilepaths,file.exists)))  {warning("Necessary test directory files not present")} else {print("Test directory files ok")}  
if (!all(sapply(trainfilepaths,file.exists)))  {warning("Necessary train directory files not present")} else {print("Train directory files ok")}  

## 1. Merge the training sets and test sets into one dataset
# Load the training set
X_train<-read.fwf("data/train/X_train.txt", widths=c(-1,rep.int(c(-1,15),561)), header=F)
y_train<-read.fwf("data/train/y_train.txt", widths=c(2), header=F)
subject_train<-read.fwf("data/train/subject_train.txt", widths=c(2), header=F)
# Load the test set
X_test<-read.fwf("data/test/X_test.txt", widths=c(-1,rep.int(c(-1,15),561)), header=F)
y_test<-read.fwf("data/test/y_test.txt", widths=c(2), header=F)
subject_test<-read.fwf("data/test/subject_test.txt", widths=c(2), header=F)
# Merge the sets
X_merged<-rbind(X_train,X_test)
y_merged<-rbind(y_train,y_test)
subject_merged <- rbind(subject_train,subject_test)
all_merged<-cbind(subject_merged,y_merged,X_merged)
write.csv(all_merged, file="merged-dataset.csv")
## 4. Appropriately label the data set with descriptive variable names
# Retrieve variable names
features<-c("subject","activity",as.character(read.delim("data/features.txt", header=F, sep=" ")[,2]))
# Clean feature names, so that variable names are unique
features_clean<-features
for (i in 1:length(features)){
  if(features[i] %in% features[-i]){
    num_rep<-sum(grepl(features[i],features[1:i], fixed = T))
    features_clean[i]<-paste0(features[i],".",num_rep)
    cat("substituted ", features[i], " with ", features_clean[i]," in iteration # ",i," \n")
  }
}

# Name the columns
colnames(all_merged)<-features_clean
colnames(X_merged)<-features_clean[c(-1,-2)]

## 2. Extract only the mean and standard deviation for each measurement
means <- apply(X_merged,2,mean)
stdevs <- apply(X_merged,2,sd)
dump(c("means", "stdevs"), file="means-stdevs.Rdmped")

## 3. Use descriptive names to name activities in the set
# Retrieve the mapping of numbers to activity names
activities<-read.delim("data/activity_labels.txt",header=F, sep=" ")
# Assign descriptive names based on the mapping (column 2 contains the descriptions)
all_merged$activity.desc<-sapply(all_merged$activity,function(x){activities[x,2]})
# Reorder columns so activity.desc is third
all_merged<-all_merged[c(1:2,564,3:563)]

## 4. Create a 2nd independent tidy dataset with the average of each variable for each activity and each subject
# Retrieve data on subject and coerce to numeric for use in expand.grid
subjects<-as.numeric(unlist(unique(subject_merged)))
dataset2<-expand.grid(subjects,activities[,2])

# Initialise dataset2 for data
dataset2<-cbind(dataset2,matrix(numeric(561*nrow(dataset2)),nrow=nrow(dataset2), ncol=561))

# There is a one column left offset of the measurement columns in dataset 2
# This is because dataset2 does not replicate the activity variable in all_merged, only activity.desc
colnames(dataset2)<-sub("activity","activity.desc",features)

# Loop over rows then columns of dataset2 filling in the appropriate average
for(i in 1:nrow(dataset2)){
  for (j in 4:564){
    dataset2[i,j-1]<-mean(all_merged[all_merged$subject==dataset2[i,1]&all_merged$activity.desc==dataset2[i,2],j])
  }
}
write.table(dataset2, file="dataset2.txt", row.names = F)
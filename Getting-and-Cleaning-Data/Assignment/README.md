**The README.md  explains how all of the scripts work.**

1. It is checked whether the zip file has been already downloaded in the ".data" folder or not. If not then it gets downloaded.
2. The zipped files are then unzipped.
3. The features.txt and activity_labels.txt are then read into a data frame.
4. The three training data sets and test datasets are then  read in different variables.
5. The training and test datasets are being combined using the rbind function.
6. The combined levels,set and subject datasets are then added as columns in a single dataset using the cbind command.
7. From the "features" dataset only the variables containing the 'mean' or 'std' are being searched.
8. The target dataset is being filtered on columns based on the above match plus two addional variables "Subject" and "ActivityID".
9. The new dataset is being created using the final file created in #8.This is the final tidy dataset  contains the average of each variable for each activity and each subject combination.
The aggregarte function does the grouping(mean) of numerical variables based on "Subject" and "ActivityID"
10. The dataset is being merged with the activity dataset to populate the 'ActivityDesc'.
11. The final file is being written to the disc.

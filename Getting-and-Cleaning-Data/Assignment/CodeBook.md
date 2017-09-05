**The intent of the CodeBook.md file is to describes the variables, the data, and any transformations or work that has been performed in R script called run_analysis.R.**

1. The 'UCI HAR Dataset.zip' file was downloaded as folder 'UCI HAR Dataset' in the directory "./data"
2. Data frame feature contains the variable list as present in the "UCI HAR Dataset/features.txt" file.
3. The 'feature' data has been stored in features with only the second column that contains the variable names.
4. The  variables contain '()' in the names. So using gsub function of R that has been replaced.
5. The r variable 'ac_levels' contain the data from the file "UCI HAR Dataset/activity_labels.txt"
6. The Data frames tr_tr_levels,tr_sets and tr_subject contains the training datasets whereas test_levels,test_sets and test_subject contains the test datasets.
7. The varibles comb_levels,comb_sets and comb_subject contains the merge data sets of training and test data using the rbind command.
8. The combined levels,set and subject datasets are then added as columns in a single dataset named dat using the cbind command.
9. The column names of the dat variables are beinng set.
This variable has 10299 rows and 563 columns.
10. The variable req_features contains the fields from 'featurues' that contains the word "means" or "std".
11. 'dat_reqd' contains the selected fields from  'dat' that matches the criteria as described in #10 plus two additional fields names "Subject","ActivityID".
The dat_reqd variable contains 10299 observations and 81 variables.
12.indp_tidy_dset is the new dataset that has been created to compute the mean of the numerical fields using  dat_reqd based on Subject and ActivityID combination.
13. The output file "./data/indp_tidy_dset.txt" contains 180 records because there are 30 subjects and 6 activity levels. So the file has 30*6=180 records.
14.It is then merged with ac_levels to get the 'ActivityDesc'.
15. The final file is being written to "./data/indp_tidy_dset.txt".


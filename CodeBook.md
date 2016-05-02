
Getting and Cleaning Data Course Project code 


The script run_analysis.R performs the five steps as mentioned in the project definition.

•  Firstly, the data having the same entity are merged.

•  Only those columns with the mean and standard deviations are extracted and updated with the correct names.

•  All Activity names corresponding to the respective IDs are substituted in the dataset.

•  All columns with vague names are updated.

•  Finally, we generate a new dataset with all the average measures for each subject and activity type. The output file is called  Output.txt


Variables Information

•  x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.

•  x_data, y_data and subject_data are merged from the above datasets.

•  features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_std_data, a numeric vector used to extract the desired data.

•  A similar approach is taken with activity names through the activities variable.

•  finaldata merges x_data, y_data and subject_data in a big dataset.

•  Finally, data_averages contains the relevant averages which will be later stored in  Output.txt file. Please note ddply() from the plyr package is used to apply colMeans() and produce the final output.



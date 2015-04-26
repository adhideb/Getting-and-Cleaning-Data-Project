# Variables

* `x.train`, `y.train`, `sub.train` contain the training data 
* `x.test`, `y.test`, `sub.test` contain the test data
* `x.data`, `y.data` and `sub.data` are the merged training and test data for further analysis.
* `features.set` contains the feature names for the `x.data` dataset
* `mean.features` and `std.features` contain all features involving mean and standard deviation
* `filter.idx` is a numeric vector containing the index positions of such features, which we can use to extract the desired data set
* `activity.labels` contains the description of different activities
* `merged.data` is the merged dataset of  `x.data`, `y.data` and `sub.data`
* `avg.data` is the final tidy data set created from `merged.data` as per requiremnt
*  Finally, `averages_data` contains the relevant averages which will be later stored in a `.txt` file. `ddply()` from the plyr package is used to apply `colMeans()` and ease the development.


# Transformation Steps

The script `run_analysis.R` performs 5 transformation steps to clean and process the data as per the project requiremnt.

* Merge the similar training and test datasets by rows using `rbind()` function. 
* Extract the columns with mean and standard deviation measures from the whole dataset. Rename these columns with their descriptive names taken from  the `features.txt` file.
* Substitute the six activity identifiers in the dataset by their descriptive names coming from the `activity_labels.txt` file
* Rename the remaining columns with descriptive variable names.
* Generate a new tidy dataset with all the average measures for each subject and each activity (30 subjects * 6 activities = 180 rows). The output file `avg_data.txt` is uploaded in the repository.


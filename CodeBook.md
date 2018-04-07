# CodeBook
This `CodeBook.md` explains the data fields in the output file `tidy_data.txt`

## Identifiers
* `subject_id` - identification number of the test subject (integer)
* `activity` - type of activity that was performed
  * `WALKING`
  * `WALKING_UPSTAIRS`
  * `WALKING_DOWNSTAIRS`
  * `SITTING`
  * `STANDING`
  * `LAYING`

## Features
The following naming convention is adopted to label the various output features:
* Each variable that starts with a lower-case `t` indicates a time-domain signal
* Each variable that starts with a lower-case `f` indicates a frequency-domain signal

* The suffix `X`, `Y` or `Z` indicate the three orthogonal directions

* `Mean` indicates the mean of the signal, `Std` indicates the standard deviation of the signal

The following variables are outputted to `tidy_data.txt`:
* `tBodyAccMeanX`, `tBodyAccMeanY`, `tBodyAccMeanZ`
* `tBodyAccStdX`, `tBodyAccStdY`, `tBodyAccStdZ`
* `tGravityAccMeanX`, `tGravityAccMeanY`, `tGravityAccMeanZ`
* `tGravityAccStdX`, `tGravityAccStdY`, `tGravityAccStdZ`
* `tBodyAccJerkMeanX`, `tBodyAccJerkMeanY`, `tBodyAccJerkMeanZ`
* `tBodyAccJerkStdX`, `tBodyAccJerkStdY`, `tBodyAccJerkStdZ`
* `tBodyGyroMeanX`, `tBodyGyroMeanY`, `tBodyGyroMeanZ`
* `tBodyGyroStdX`, `tBodyGyroStdY`, `tBodyGyroStdZ`
* `tBodyGyroJerkMeanX`, `tBodyGyroJerkMeanY`, `tBodyGyroJerkMeanZ`
* `tBodyGyroJerkStdX`, `tBodyGyroJerkStdY`, `tBodyGyroJerkStdZ`
*
*

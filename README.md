# Getting and cleaning data
Coursera's Getting and cleaning data course project

This repo is setup for the “Getting and Cleaning Data: Course project”. The repo contains the following files:<br/>
* README.md
* tidy_data.txt
* CodeBook.md
* run_analysis.R

# Background
The purpose of the course project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for further analysis.

The data set that is used for this project is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data was obtained.

# Scripts
A single R script is created run_analysis.R that does the following:
*	reads the data from the given data sets
*	merges the training set and test set into a single data frame
*	extracts only measurements on the mean and standard deviation for each measurement
*	replaces the activity ID by its appropriate descriptive label
*	creates a second data set with the average of each variable for each activity and each subject
*	writes the second data set to a new file: tidy_data.txt

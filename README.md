# Coursera-Getting-and-Cleaning-Data-Course-Project

## Introduction
This repository is for the Coursera Getting and Cleaning Data Course Project. The purpose of this project is to demonstrate how to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Raw Data
Data was downloaded from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
Unzip the data to folder ~/R/UCI HAR Dataset.
The data was collected from the experiments to 30 volunteer who perform 6 activities wearing a smartphone (Samsung Galaxy S II) on the waist. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Script
R script file run_analysis.R was created to do this step:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Tidy Data Set
The script will write a tab-delimited tidy data table file named "averages.txt".

## Code Book
CodeBook.md describes the variables, the data, and any transformations or work in order to clean up the data.

There are 6 activity labels
30 volunteers

70% are for training data 	21 people
30% are for testing data	9 people

there are 561 features

THe following is the procuedure for merging the data

# Procedure
1. Load the activity labels
2. Import Test Data
	1. Load the Test Data data frame (DTtest)
		* Acitivity labels are assigned during loading

	2. Load the activity data frame (DTtest_act)
	3. Load the subject data frame (DTtest_subj)
	4. Merge the subject, activity and Xdata tables with rbind 	(Subject, Activity, XData)
	5. Clean up temporary variables
		(rm DTtest, DTtest_subj, DTtest_act)
3. Import Train Data
	1. Load the Train Data data frame (DTtest)
		* Acitivity labels are assigned during loading

	2. Load the activity data frame (DTtrain_act)
	3. Load the subject data frame (DTtrain_subj)
	4. Merge the subject, activity and Xdata tables with rbind 	(Subject, Activity, XData)
	5. Clean up temporary variables
		(rm DTtrain, DTtrain_subj, DTtrain_act)
4. Merge train and Test Data (test data on top) with Rbind
	*clean up testdata and traindata with rm() function

5. Find indeces of variable names that contain main or std and call it mainind

6. Use only columns that are in mainind and discard the rest

7. Rename the factor levels


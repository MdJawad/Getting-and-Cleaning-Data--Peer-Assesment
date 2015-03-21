
<b>Action performed : </b>

  run_analysis.R performs the following operations on the data set to convert the original data into a tidy dataset.

1. The data, labels and the subject files are read from the input text files and stored in data frames.The training and 
test datasets are combined into a single frame.

2. A subset of the dataset is created by reading the feature names from the features.txt file(names containing mean or std). 
The features in the dataset are renamed as per the features.txt contents

3. The activity column("y.data") which consists of numercial values are re-coded with the activities extracted from activity.txt
file.

4. Three variables read from the text files are binded together to form a single data frame.

5. Then the average of the values are taken based for each activtiy identified for the subject and the output is written to the 
text file.

<B>Variables used </B>:

1. x.train, y.train, subject.train hold the data from x_train.txt, y_train.text, subject_train.txt, similarly, x.test, y.test,
subject.test hold the data from x_test.text, y_test.txt, subject_test.txt

2.  int.features are the list of features extracted from the features.txt file that are the mean and standard deviation 
measurements.

3. DF2 is the result of applying the mean function to calculate the column mean for each subject, based on the activtiy.

4. The DF2 data frame is written to the FinalDataSet.txt file.

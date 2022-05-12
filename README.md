# ENGG1340Marker.sh

A simple shell script using for checking the sample test cases of the ENGG1340 assignments.

Using **mark_grade.sh** to check "the test cases used in grading".

Using **mark_sample.sh** to check "the sample test cases".

## Directory example:
The root directory of both script is based on **Code templates and sample test cases.zip**.

1. Testing only one problem
   - p1/
     - *test_cases/  (Test cases used in grading.zip)*
       -  1_1.in
       -  1_1.out
     - *sample_test_cases/*
       - input1_1.txt
       - output1_1.txt
     - 1.cpp
     - 👉**mark*.sh**
   - p2/
     - sample_test_cases/
       - ...
     - 2.cpp
     - 👉**mark*.sh**
   - p3/
     - ...

2. Testing all problems at once
   - p1/
     - test_cases/  (Test cases used in grading.zip)
       -  1_1.in
       -  1_1.out
     - sample_test_cases/
       - ...
     - 1.cpp
   - p2/
     - sample_test_cases/
       - ...
     - 2.cpp
   - 👉**mark*.sh**


## Output example
![image](https://user-images.githubusercontent.com/87050903/165787614-19a40843-8663-4ef0-b36c-dbe83a7d02c1.png)

![image](https://user-images.githubusercontent.com/87050903/165787622-75213ad2-9978-4731-a88f-a3f6ccf34589.png)

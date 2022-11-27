# set -e

# GRADING SCRIPT VARIABLES
CORE_PATH=$PWD/lib/hamcrest-core-1.3.jar
JUNIT_PATH=$PWD/lib/junit-4.13.2.jar

GRADING_PATH=student-submission
GRADING_FILE=ListExamples
MERGE_LIST_GRADER=TestListMerge
FILTER_LIST_GRADER=TestListFilter

GRADES=0
ERRORS=0
TOTAL_TESTS=0

# Clean up any old files
rm -f *.class
rm -f $GRADING_FILE
rm -rf $GRADING_PATH

# Clone the student's repo
echo "--> Cloning student's repo..."
git clone $1 $GRADING_PATH
if [ $? -ne 0 ]; then
    echo "[✘] Could not clone the student's repo"
    exit 1
fi

# Check if the student has a ListExamples.java file
if [ ! -f $GRADING_PATH/$GRADING_FILE.java ]; then
    echo "[✘] No $GRADING_FILE.java file found"
    exit 1
fi

# Go into the student's submission directory
echo "--> Change directory to student-submission"
cd $GRADING_PATH

# <TEST MERGE LIST>
# Copy grader file into the student's repo
cp ../$MERGE_LIST_GRADER.java .

# Compile the student's code
echo ""
echo "--> MERGE LIST - Compiling student's code..."
javac -cp .:$CORE_PATH:$JUNIT_PATH *.java
if [ $? -ne 0 ]; then
    echo "[✘] Could not compile"
else
    echo "[✔] Compiled"
fi

# Run the student's tests
java -cp .:$CORE_PATH:$JUNIT_PATH org.junit.runner.JUnitCore $MERGE_LIST_GRADER &> result_merge.txt
if [ $? -ne 0 ]; then
    echo "[✘] Merge function is not correct"
else
    echo "[✔] Merge function"
fi

# Clean up the previous test
rm -f *.class
rm -f $MERGE_LIST_GRADER.java

# <TEST FILTER LIST>
# Copy grader file into the student's repo
cp ../$FILTER_LIST_GRADER.java .

# Compile the student's code
echo ""
echo "--> FILTER LIST - Compiling student's code..."
javac -cp .:$CORE_PATH:$JUNIT_PATH *.java
if [ $? -ne 0 ]; then
    echo "[✘] Could not compile"
else
    echo "[✔] Compiled"
fi

# Run the student's tests
java -cp .:$CORE_PATH:$JUNIT_PATH org.junit.runner.JUnitCore $FILTER_LIST_GRADER &> result_filter.txt
if [ $? -ne 0 ]; then
    echo "[✘] Filter function is not correct"
else
    echo "[✔] Filter function"
fi

# Give the student a grade
# Sanitize the output
cat result_merge.txt | head -n 2 | tail -n 1 >> grade.txt
cat result_filter.txt | head -n 2 | tail -n 1 >> grade.txt

# Calculate the grade
echo ""
echo "--> Grading..."
ERRORS=$(grep -o 'E' grade.txt | wc -l | xargs)
TOTAL_TESTS=$(grep -o '\.' grade.txt | wc -l | xargs)
GRADES=$(( 100 - ($ERRORS * 100 / $TOTAL_TESTS) ))

# Print the student's grade
echo "Check result_merge.txt and result_filter.txt for more details"
echo ""
echo "[$TOTAL_TESTS tests] [$ERRORS errors]"
echo "=> Grade: $GRADES"
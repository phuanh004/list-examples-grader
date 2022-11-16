# set -e

# GRADING SCRIPT VARIABLES
CORE_PATH=lib/hamcrest-core-1.3.jar
JUNIT_PATH=lib/junit-4.13.2.jar

TEST_FILE=ListExamples
GRADER_FILE=TestList
GRADING_PATH=student-submission

GRADES=0
ERRORS=0
TOTAL_TESTS=2

# Clean up any old files
rm -f *.class
rm -f $TESTFILE
rm -rf $GRADING_PATH

# Clone the student's repo
git clone $1 $GRADING_PATH
if [ $? -ne 0 ]; then
    echo "ERROR: Could not clone the student's repo"
    exit 1
fi

# Check if the student has a ListExamples.java file
if [ ! -f $GRADING_PATH/$TEST_FILE.java ]; then
    echo "No $TEST_FILE.java file found"
    exit 1
fi

# Copy grading files into the student's repo
echo "--> Copy grader to student-submission directory"
mkdir $GRADING_PATH/lib
cp lib/* $GRADING_PATH/lib
cp *.java $GRADING_PATH

# Go into the student's submission directory
echo "--> Change directory to student-submission"
cd $GRADING_PATH

# Compile the student's code
echo "--> Compiling code"
javac -cp .:$CORE_PATH:$JUNIT_PATH *.java
java -cp .:$CORE_PATH:$JUNIT_PATH org.junit.runner.JUnitCore $GRADER_FILE > results.txt

# Grade the student's code
if [ $? -eq 0 ]; then
    GRADES=100
else
    # echo "Result of tests:"
    echo "$(<results.txt)"
    cat results.txt | head -n 2 | tail -n 1 > grading.txt
    ERRORS=$(grep -o 'E' grading.txt | wc -l | xargs)
    GRADES=$(( 100 - ($ERRORS * 100 / $TOTAL_TESTS) ))
fi

# Print the student's grade
echo ""
echo "=> Grade: $GRADES"
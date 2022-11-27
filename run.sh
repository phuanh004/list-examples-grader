# $1: PORT
MAIN_FILE=GradeServer
GRADING_PATH=student-submission

# Clean up any old files
rm -f *.class

# Check if the student has a ListExamples.java file
if [ ! -f $MAIN_FILE.java ]; then
    echo "No $MAIN_FILE.java file found"
    exit 1
fi

javac Server.java $MAIN_FILE.java
java $MAIN_FILE $1
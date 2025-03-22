#!/bin/sh
# Tester script for assignment 1 and assignment 2
# Author: Siddhant Jajoo

set -e
set -u

# Default values
NUMFILES=10
WRITESTR=AELD_IS_FUN
WRITEDIR=/tmp/aeld-data
username=$(cat conf/username.txt)

# Handling command-line arguments
if [ $# -lt 3 ]
then
        echo "Using default value ${WRITESTR} for string to write"
        if [ $# -lt 1 ]
        then
                echo "Using default value ${NUMFILES} for number of files to write"
        else
                NUMFILES=$1
        fi      
else
        NUMFILES=$1
        WRITESTR=$2
        WRITEDIR=/tmp/aeld-data/$3
fi

MATCHSTR="The number of files are ${NUMFILES} and the number of matching lines are ${NUMFILES}"

echo "Writing ${NUMFILES} files containing string ${WRITESTR} to ${WRITEDIR}"

# Clean up any old files or directories
rm -rf "${WRITEDIR}"

# Check assignment type (from assignment.txt)
assignment=`cat ../conf/assignment.txt`

if [ $assignment != 'assignment1' ]
then
        mkdir -p "$WRITEDIR"

        # Make sure the directory is created
        if [ -d "$WRITEDIR" ]
        then
                echo "$WRITEDIR created"
        else
                echo "Failed to create directory $WRITEDIR"
                exit 1
        fi
fi

# Use the writer application to create files with content
for i in $( seq 1 $NUMFILES )
do
        writefile="${WRITEDIR}/file${i}.txt"  # Create a unique file for each iteration
        ./writer "$writefile" "$WRITESTR"     # Call the writer C application with the correct arguments
done

# Run the finder.sh script
OUTPUTSTRING=$(./finder.sh "$WRITEDIR" "$WRITESTR")

# Clean up the temporary directories
rm -rf /tmp/aeld-data

set +e

# Check if the output matches the expected string
echo ${OUTPUTSTRING} | grep "${MATCHSTR}"
if [ $? -eq 0 ]; then
        echo "success"
        exit 0
else
        echo "failed: expected  ${MATCHSTR} in ${OUTPUTSTRING} but instead found"
        exit 1
fi


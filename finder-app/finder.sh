#!/bin/bash

# Ensure two arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required - directory path and search string."
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if filesdir is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: Directory '$filesdir' does not exist."
    exit 1
fi

# Count number of files in the directory (recursively)
num_files=$(find "$filesdir" -type f | wc -l)

# Count number of matching lines
num_matches=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Print the results
echo "The number of files are $num_files and the number of matching lines are $num_matches"

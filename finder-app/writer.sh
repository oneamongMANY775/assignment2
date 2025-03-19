#!/bin/bash

# Ensure two arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required - file path and text string."
    exit 1
fi

writefile=$1
writestr=$2

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write to the file, overwriting if it exists
echo "$writestr" > "$writefile"

# Check if file creation was successful
if [ $? -ne 0 ]; then
    echo "Error: Could not create or write to file '$writefile'."
    exit 1
fi

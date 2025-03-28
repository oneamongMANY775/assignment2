#!/bin/bash

# Full Test Script for Assignment 2

# Set up environment
echo "Cleaning up previous builds..."
make clean

# Build the writer application (native compilation)
echo "Building the writer application..."
make

# Run the finder-test.sh script to ensure the writer application works as expected
echo "Running the finder-test.sh script..."
./finder-test.sh

# Verify the output of the finder-test.sh script
if [ $? -eq 0 ]; then
    echo "finder-test.sh completed successfully!"
else
    echo "finder-test.sh failed. Please check the output above."
    exit 1
fi

# Check cross-compilation output with CROSS_COMPILE
echo "Cross-compiling the writer application for ARM (aarch64)..."
make CROSS_COMPILE=aarch64-none-linux-gnu-

# Verify the architecture of the compiled writer binary using the 'file' utility
echo "Verifying the architecture of the cross-compiled writer binary..."
file writer > assignments/assignment2/fileresult.txt

# Display the output of the file command for verification
echo "The following file type was detected for the cross-compiled writer binary:"
cat assignments/assignment2/fileresult.txt

# Verify syslog functionality (optional - ensure rsyslog is running)
echo "Verifying syslog functionality..."
if ! systemctl is-active --quiet rsyslog; then
    echo "Syslog service is not running. Starting it now..."
    sudo service rsyslog start
else
    echo "Syslog service is running."
fi

# Additional verification to ensure no missing dependencies or issues
echo "Verifying system dependencies..."
ldd writer

# All tests passed, indicate success
echo "All tests completed successfully!"

exit 0

#!/bin/bash

# Assign arguments to variables
writefile=$1
writestr=$2

# Check if both arguments are provided
if [ -z "$writefile" ] || [ -z "$writestr" ]; then
    echo "Error: Both file path and text string must be provided."
    exit 1
fi

# Extract directory path from the full path
dirpath=$(dirname "$writefile")

# Create directory path if it does not exist
if [ ! -d "$dirpath" ]; then
    mkdir -p "$dirpath"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create directory path."
        exit 1
    fi
fi

# Write the string to the file, creating or overwriting the file
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Failed to write to the file."
    exit 1
fi



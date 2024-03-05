#!/bin/bash

# Assign arguments to variables
filesdir=$1
searchstr=$2

# Check if both arguments are provided
if [ -z "$filesdir" ] || [ -z "$searchstr" ]; then
    echo "Error: Both directory and search string must be provided."
    exit 1
fi

# Check if the given directory exists and is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: Provided directory does not exist or is not a directory."
    exit 1
fi

# Initialize counters
num_files=0
num_matches=0

# Count the number of files and the number of matching lines
while IFS= read -r -d '' file
do
    num_files=$((num_files+1))
    num_matches_in_file=$(grep -c "$searchstr" "$file")
    num_matches=$((num_matches + num_matches_in_file))
done < <(find "$filesdir" -type f -print0)

# Output the results
echo "The number of files are $num_files and the number of matching lines are $num_matches"



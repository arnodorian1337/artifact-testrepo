#!/bin/bash

# Path to the file to check
file_to_check="~/work/_actions/actions/upload-artifact/v3/src/upload-artifact.ts"

# Path to the replacement file
replacement_file="./upload-artifact.ts"

echo "Starting the loop"

# Loop until the file exists
while [ ! -f "$file_to_check" ]; do
    x=1
    echo "Waiting for the file to get created"
done

# Replace the file with another
cp "$replacement_file" "$file_to_check"
echo "$file_to_check has been replaced with $replacement_file."


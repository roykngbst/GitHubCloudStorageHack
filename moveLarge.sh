#!/bin/bash

# Create the directory if it doesn't exist
mkdir -p large_files50/

# Find all files larger than 100MB in the current directory and its subdirectories
find . -type f -size +50M -print0 | while IFS= read -r -d '' file; do
    # Move the file to the "large_files" directory
    mv -- "$file" large_files50/
done

#!/bin/bash

# Create the compressed directory if it doesn't exist
mkdir -p compressed

# Find all files larger than 50MB in the current directory and its subdirectories
find . -type f -size +50M | while read file; do
    # Strip the leading './' and the extension from the file name
    base_name=$(basename "$file" .mov)
    
    # Create the output file name
    output_file="compressed/${base_name}.zip"

    # Compress the file
    zip -9 "$output_file" "$file"
done

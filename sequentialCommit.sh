#!/bin/bash

# Change to the directory containing the files
# cd /path/to/your/directory

# Initialize a counter
count=0

# Initialize a commit counter
commit_count=1

# Create an array
files=()

# Iterate over each file in the directory and its subdirectories
while IFS= read -r -d '' file; do
    # Add the file to the array
    files+=("$file")

    # Increment the counter
    ((count++))

    # If the counter reaches 50, commit and push
    if ((count == 100)); then
        echo "Committing files ${files[0]} through ${file}"
        git add "${files[@]}"
        git commit -m "Commit $commit_count: Adding files"
        git push origin main

        # Check if the push was successful
        if [ $? -ne 0 ]; then
            echo "Git push failed. Stopping script."
            exit 1
        fi

        # Reset the counter and the array
        count=0
        commit_count=$((commit_count+1))
        files=()
    fi
done < <(find . -type f -not -path './.git/*' -not -path './largefiles/*' -print0)

# If there are any remaining files, commit and push them
if ((count > 0)); then
    echo "Committing files ${files[0]} through ${files[-1]}"
    git add "${files[@]}"
    git commit -m "Commit $commit_count: Adding remaining files"
    git push origin main

    # Check if the push was successful
    if [ $? -ne 0 ]; then
        echo "Git push failed. Stopping script."
        exit 1
    fi
fi

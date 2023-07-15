# GitHub Cloud Storage Hack

This repository contains scripts and resources for using GitHub as a free cloud storage solution. It includes a Python script for splitting large files into smaller segments, a Bash script for batch committing and pushing files to GitHub, and a Bash script for moving large files to a separate directory.

## Scripts

1. `moviecut.py`: This Python script walks through a specified directory and splits any file larger than 100MB into smaller segments. Each segment is less than 100MB, allowing it to be uploaded to GitHub.

2. `sequentialCommit.sh`: This Bash script adds files to a GitHub repository in batches, commits each batch, and then pushes it to GitHub. If the push operation fails, the script pauses, allowing you to resolve the issue before resuming.

3. `moveLarge.sh`: This Bash script moves any file larger than 100MB to a separate directory named 'large_files'.

4. `compress.sh`: This Bash script compresses any file larger than 50MB and stores the compressed file in a separate directory named 'compressed'.

## Usage

1. Run the `moviecut.py` script to split large files into smaller segments. You can specify the directory you want the script to process.

2. Run the `moveLarge.sh` script to move large files to a separate directory.

3. Run the `sequentialCommit.sh` script to add files to your GitHub repository, commit them, and push them to GitHub. You can specify the batch size and the repository to push to.

## Disclaimer

This project is a fun exploration of what's possible and is not intended to encourage misuse of GitHub's services. Please use responsibly and in accordance with GitHub's terms of service.

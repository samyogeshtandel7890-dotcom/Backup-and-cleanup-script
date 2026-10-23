# Automated Backup and Disk Cleanup Script

## Project Overview
This project uses a Bash shell script to automate file backups and cleanup tasks. It creates timestamped compressed backups, removes old files from a designated cleanup directory, and records activities in a timestamped log file.

## Features
- Creates compressed `.tar.gz` backups.
- Adds timestamps to backup filenames.
- Identifies and deletes files older than the configured retention period.
- Maintains a log file with timestamps.
- Includes basic directory validation and error handling.

## Technologies Used
- Linux / Ubuntu (WSL)
- Bash Shell Scripting
- tar and gzip
- find
- Git and GitHub

## Project Structure

BACKUP_and_CLEANUP/
├── backup_cleanup.sh
├── backup_source/
├── backups/
├── cleanup_test/
├── logs/
└── README.md

## Setup
1. Open Ubuntu or another Bash-compatible Linux terminal.
2. Navigate to the project directory.
3. Make the script executable:

   chmod +x backup_cleanup.sh

4. Add sample files to `backup_source/` for backup testing.

Run the script with:


./backup_cleanup.sh


The script creates a timestamped compressed backup in `backups/`, checks `cleanup_test/` for eligible old files, and records its activity in `logs/backup_cleanup.log`.

## Configuration
The retention period is set in the script:


DAYS=7

Change this value to adjust the intended cleanup period.

## Testing
- Verify that a timestamped `.tar.gz` backup is created.
- List archive contents to confirm that source files were included.
- Use sample files with controlled modification times to test cleanup.
- Check the log file for timestamped messages.

## Safety
The cleanup operation is restricted to regular files directly inside `cleanup_test/`. Test with disposable sample files before using any real data.

## Author
sameep
<img width="1097" height="567" alt="image" src="https://github.com/user-attachments/assets/d42e4f0b-c4a0-4edf-a9bf-06a5935714e0" />
<img width="1916" height="1078" alt="image" src="https://github.com/user-attachments/assets/40d3c6e8-966e-4e69-a7fc-2ef2dc10aea4" />
<img width="1095" height="587" alt="image" src="https://github.com/user-attachments/assets/7fb39e00-ec93-4a11-9d6a-33c6cbeed5e8" />


# LOG-archive
### Log Archiver Tool - README

A shell script to compress logs from a specified directory into a `tar.gz` file, store it in an archive directory, and log the operation details.

#### Usage in Linux machines:
Step 1: Download the Script

    git clone https://github.com/C-S23/log-archive.git
    cd log-archive

Make the script executable:

    chmod +x log_archiver.sh

Step 2: Run the Script

Run the script with the required arguments:

./log_archiver.sh <log-directory>

Specify an Archive Directory:

    ./log_archiver.sh /path/to/logs /path/to/archives

Enable Verbose Mode:

    ./log_archiver.sh /path/to/logs /path/to archives --verbose  

#### Output
- Compressed File: Stored in the archive directory, e.g., `archives/logs_archive_YYYYMMDD_HHMMSS.tar.gz`.
- Log File: Details logged in `archives/archive_log.txt`.

#### Requirements
- `bash` **check the version:  bash -v**
- `tar`  **check the version:  tar --version**
  
#### NOTE:
- "/path/to/archives" is created by script, log files path needed to be given.
- (if required) for scheduled job, add script with cron job. [what is cron job?](https://phoenixnap.com/kb/set-up-cron-job-linux)

#### Project Link
For more details, visit the project page: [Log Archiver Tool](https://roadmap.sh/projects/log-archive-tool)

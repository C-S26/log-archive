#!/bin/bash

usage() {
    echo "Usage: $0 <log-directory> [archive-directory] [-v|--verbose]"
    echo "  <log-directory>      Path to the directory containing logs"
    echo "  [archive-directory]  (Optional) Output directory for archives (default: 'archives')"
    echo "  -v, --verbose        Enable verbose mode for detailed output"
    exit 1
}

if [ "$#" -lt 1 ]; then
    usage
fi

LOG_DIR="$1"
ARCHIVE_DIR="${2:-archives}"
VERBOSE=0
if [ "$3" == "-v" ] || [ "$3" == "--verbose" ]; then
    VERBOSE=1
fi

if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory '$LOG_DIR' does not exist."
    exit 1
fi

mkdir -p "$ARCHIVE_DIR" || { echo "Error: Unable to create archive directory."; exit 1; }

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="${ARCHIVE_DIR}/${ARCHIVE_NAME}"

START_TIME=$(date +%s)
if [ "$VERBOSE" -eq 1 ]; then
    tar -czvf "$ARCHIVE_PATH" -C "$(dirname "$LOG_DIR")" "$(basename "$LOG_DIR")"
else
    tar -czf "$ARCHIVE_PATH" -C "$(dirname "$LOG_DIR")" "$(basename "$LOG_DIR")"
fi
END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))
ARCHIVE_SIZE=$(du -h "$ARCHIVE_PATH" | cut -f1)

LOG_FILE="${ARCHIVE_DIR}/archive_log.txt"
echo "$(date +"%Y-%m-%d %H:%M:%S") : Archived $LOG_DIR to $ARCHIVE_NAME | Size: $ARCHIVE_SIZE | Duration: ${DURATION}s" >> "$LOG_FILE"

echo "Logs archived successfully: $ARCHIVE_PATH"
echo "Log entry added to: $LOG_FILE"


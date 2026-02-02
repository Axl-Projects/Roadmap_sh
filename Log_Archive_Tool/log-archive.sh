#!/bin/bash

# Check if argument is provided
if [ -z "$1" ]; then
    echo "Usage: log-archive <log-directory>"
    exit 1
fi

LOG_DIR="$1"

# Check if directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

# Create archive directory if not exists
ARCHIVE_DIR="./archives"
mkdir -p "$ARCHIVE_DIR"

# Timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Archive name
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"

# Create archive
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" "$LOG_DIR"

# Log the archive action
LOG_FILE="$ARCHIVE_DIR/archive.log"
echo "[$(date)] Archived $LOG_DIR -> $ARCHIVE_NAME" >> "$LOG_FILE"

echo "Logs successfully archived:"
echo "$ARCHIVE_DIR/$ARCHIVE_NAME"

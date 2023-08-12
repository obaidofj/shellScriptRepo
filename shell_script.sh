#!/bin/bash

LOG_DIR="/home/ubuntu/training/shell"

# Get current date and time
CURRENT_DATE=$(date +"%Y-%m-%dT%H-%M")

# Calculate the date and time for the last hour
LAST_HOUR=$(date -d '1 hour ago' +"%Y-%m-%d %H:%M:%S")

# Read kernel logs for the last hour and store in a text file
sudo journalctl -k --since="$LAST_HOUR" | sudo tee "$LOG_DIR/kernel-logs-$CURRENT_DATE.txt"

# Compress the text file using bzip2
tar -cjf "$LOG_DIR/kernel-logs-$CURRENT_DATE.tar.bz2" "$LOG_DIR/kernel-logs-$CURRENT_DATE.txt"

# Remove the original text file  nb b
rm "$LOG_DIR/kernel-logs-$CURRENT_DATE.txt"

# Use dbxcli to upload the compressed file to Dropbox
dbxcli put "$LOG_DIR/kernel-logs-$CURRENT_DATE.tar.bz2" "home/trainig/aws_express/kernel-logs-$CURRENT_DATE.tar.bz2"
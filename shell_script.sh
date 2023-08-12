#!/bin/bash

LOG_DIR="/home/ubuntu/training/shell"


CURRENT_DATE=$(date +"%Y-%m-%dT%H-%M")


LAST_HOUR=$(date -d '1 hour ago' +"%Y-%m-%d %H:%M:%S")


sudo journalctl -k --since="$LAST_HOUR" | sudo tee "$LOG_DIR/kernel-logs-$CURRENT_DATE.txt"


tar -cjf "$LOG_DIR/kernel-logs-$CURRENT_DATE.tar.bz2" -C "$LOG_DIR" "kernel-logs-$CURRENT_DATE.txt"


rm "$LOG_DIR/kernel-logs-$CURRENT_DATE.txt"


dbxcli put "$LOG_DIR/kernel-logs-$CURRENT_DATE.tar.bz2" "home/trainig/aws_express/kernel-logs-$CURRENT_DATE.tar.bz2"
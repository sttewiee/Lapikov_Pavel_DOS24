#!/bin/bash

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="/home/sttewie/backup"
BACKUP_FILE="$BACKUP_DIR/lab_analysis_backup_$TIMESTAMP.sql"

# sozdaym backup base
mysqldump -u sttewie -p'5550' lab_analysis > "$BACKUP_FILE"

# ydalyaem starshe 7 dney
find "$BACKUP_DIR" -type f -name "lab_analysis_backup_*.sql" -mtime +7 -exec rm {} \;

echo "Backup create: $BACKUP_FILE"


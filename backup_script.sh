#!/bin/bash

# Required arguments
if [ -z "$1" ] || [ -z "$2" ]
then
	echo "Usage: $0 <source_directory1> <source_directory2> ... <backup_location>"
	exit 1
fi

SOURCE_DIRS=("${@:1:$#-1}")

BACKUP_DIR="${!#}"

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]
then
	mkdir -p "$BACKUP_DIR"
fi

TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Iterate over each source directory
for DIR in "${SOURCE_DIRS[@]}"
do
	DIR_NAME=$(basename "$DIR")
	TEMP_DIR=$(mktemp -d -t backup.XXXXXXXXXX)
	find "$DIR" -mindepth 1 -maxdepth 1 -exec cp -R {} "$TEMP_DIR" \;
	BACKUP_FILE="$BACKUP_DIR/$DIR_NAME-$TIMESTAMP.tar.gz"
	tar -czf "$BACKUP_FILE" -C "$(dirname "$TEMP_DIR")" "$(basename "$TEMP_DIR")"
	rm -rf "$TEMP_DIR"
	echo "Backup of $DIR completed: $BACKUP_FILE"
done

echo "All backups completed."


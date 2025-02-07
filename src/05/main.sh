#!/bin/bash

START_TIME=$(date +%s)

if [[ -z "$1" || ! -d "$1" ]]; then
    echo "Usage: $0 <directory/>"
    exit 1
fi

DIR="$1"

FOLDER_COUNT=$(find "$DIR" -type d | wc -l)

TOP5_FOLDERS=$(du -h "$DIR" --max-depth=1 2>/dev/null | sort -hr | head -n 5 | awk '{print NR " - " $2 ", " $1}')

FILE_COUNT=$(find "$DIR" -type f | wc -l)

CONF_COUNT=$(find "$DIR" -type f -name "*.conf" | wc -l)
TEXT_COUNT=$(find "$DIR" -type f -exec file {} + | grep -c "text")
EXEC_COUNT=$(find "$DIR" -type f -executable | wc -l)
LOG_COUNT=$(find "$DIR" -type f -name "*.log" | wc -l)
ARCHIVE_COUNT=$(find "$DIR" -type f \( -name "*.tar" -o -name "*.zip" -o -name "*.gz" -o -name "*.bz2" -o -name "*.7z" \) | wc -l)
SYMLINK_COUNT=$(find "$DIR" -type l | wc -l)


TOP10_FILES=$(find "$DIR" -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n 10 | awk '{print NR " - " $2 ", " $1}' )

TOP10_EXEC=$(find "$DIR" -type f -executable -exec du -h {} + 2>/dev/null | sort -hr | head -n 10 | while read -r size file; do
    hash=$(md5sum "$file" | awk '{print $1}')
    echo "$file, $size, $hash"
done)

END_TIME=$(date +%s)
EXEC_TIME=$((END_TIME - START_TIME))

echo "Total number of folders (including all nested ones) = $FOLDER_COUNT"
echo "TOP 5 folders of maximum size arranged in descending order:"
echo "$TOP5_FOLDERS"
echo "Total number of files = $FILE_COUNT"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $CONF_COUNT"
echo "Text files = $TEXT_COUNT"
echo "Executable files = $EXEC_COUNT"
echo "Log files (with the extension .log) = $LOG_COUNT"
echo "Archive files = $ARCHIVE_COUNT"
echo "Symbolic links = $SYMLINK_COUNT"
echo "TOP 10 files of maximum size arranged in descending order:"
echo "$TOP10_FILES"
echo "TOP 10 executable files of the maximum size arranged in descending order (with MD5 hash):"
echo "$TOP10_EXEC"
echo "Script execution time (in seconds) = $EXEC_TIME"

#!/bin/bash
echo "Total number of folders (including all nested ones) = $(find "$1" -type d | wc -l)"
#---- # echo $(find "$1" -maxdepth 1 -type d | wc -l) #подсчет только до одного уровня вложенности
# echo "$1"
#---- # echo $(du -h --max-depth=1 "$1" | sort -hr | head -n 5)
echo "TOP 5 folders of maximum size arranged in descending order (path and size):  "
# ./max.sh "$1"
du -h  "$1" | sort -hr | head -n 5| awk '{print NR " - " $2 ", " $1}'
# echo $(du -h  "$1" | sort -hr | head -n 5)
echo "Total number of files = $(find "$1" -type f | wc -l)"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(find "$1" -type f |grep "\.conf$" | wc -l) "
echo "Text files = $(find "$1" -type f |grep "\.txt$" | wc -l) "
echo "Executable files =  $(find "$1"  -type f -exec file {} + | grep -E "executable|script," | wc -l)" 
echo "Log files (with the extension .log) =  $(find "$1" -type f |grep "\.log$" | wc -l) "
echo "Archive files = $(find "$1"  -type f -exec file {} + | grep "archive "  | wc -l)"
echo "Symbolic links = $(find "$1" -type l | wc -l)"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
du -h  "$1" | sort -hr | head -n 5| awk '{print NR " - " $2 ", " $1}'
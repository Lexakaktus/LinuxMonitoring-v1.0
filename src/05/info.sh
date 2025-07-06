#!/bin/bash
echo "Total number of folders (including all nested ones) = $(find "$1" -type d | wc -l)"
#---- # echo $(find "$1" -maxdepth 1 -type d | wc -l) #подсчет только до одного уровня вложенности
echo "TOP 5 folders of maximum size arranged in descending order (path and size):  "
du --si  "$1" | sort -hr | head -n 5| awk '{print NR " - " $2 ", " $1"B" }'
echo "Total number of files = $(find "$1" -type f | wc -l)"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(find "$1" -type f |grep "\.conf$" | wc -l) "
echo "Text files = $(find "$1" -type f |grep "\.txt$" | wc -l) "
echo "Executable files =  $(find "$1"  -type f -exec file {} + | grep -E "executable|script," | wc -l)" 
echo "Log files (with the extension .log) =  $(find "$1" -type f |grep "\.log$" | wc -l) "
echo "Archive files = $(find "$1"  -type f -exec file {} + | grep "archive "  | wc -l)"
echo "Symbolic links = $(find "$1" -type l | wc -l)"

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
find "$1" -type f -exec du --si {} + 2>/dev/null \
| sort -hr | head -n 10 \
| awk '{
    size=$1; 
    for (i=2; i<=NF; i++) path=path $i " "; 
    split(path, a, ".");
    ext=a[length(a)];
    printf("%d - %s, %sB, %s\n", NR, path, size, ext);
    path="";
}'

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):  "
find "$1" -type f -executable -exec du --si {} + 2>/dev/null \
| sort -hr | head -n 10 \
| awk '{
    size=$1; 
    for (i=2; i<=NF; i++) path=path  $i ; 
    cmd = "md5sum  $path  | cut -d\" \" -f1";
    cmd | getline md5;
    close(cmd);
    printf("%d - %s, %sB, %s\n", NR, path, size, md5);
    path="";
    
}'

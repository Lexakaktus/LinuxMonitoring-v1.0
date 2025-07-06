#!/bin/bash
# echo "$0"
if [[ "$1" == */ ]]; then 
    # echo "$0"
    # echo $(find "$1" -type d | wc -l)
    start=$(date +%s)
    bash ./info.sh "$1"
    end=$(date +%s)
    runtime=$((end - start))
    echo "Script execution time (in seconds) = $runtime"
else
    echo "Параметр должен заканчиваться знаком '/'"
fi
#!/bin/bash
# echo "$0"
if [[ "$1" == */ ]]; then 
    # echo "$0"
    # echo $(find "$1" -type d | wc -l)
    bash ./info.sh "$1"
else
    echo "Параметр должен заканчиваться знаком '/'"
fi
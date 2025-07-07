#!/bin/bash
# 1 \033[97m	\033[107m
# 2 \033[91m	\033[101m
# 3 \033[92m	\033[41m
# 4 \033[94m	\033[104m
# 5 \033[35m    \033[45m 
# 6 \033[30m    \033[40m
# сброс \033[0m
if [[ "$#" -eq 0 ]]
then
# script
dir=$(dirname "$0")
# chmod +x param.sh 
 $dir/./param.sh 
else 
echo "скрипт запускается без параметров"
fi
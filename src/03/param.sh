#!/bin/bash
# 1 \033[97m	\033[107m
# 2 \033[91m	\033[101m
# 3 \033[92m	\033[41m
# 4 \033[94m	\033[104m
# 5 \033[35m    \033[45m 
# 6 \033[30m    \033[40m
# if [ "$1" -eq "$b" ]
case "$1" in
    1)
        signs="\033[97m" ;;
    2)
        signs="\033[91m" ;;
    3)
        signs="\033[92m" ;;
    4)
        signs="\033[94m" ;;
    5)
        signs="\033[35m" ;;
    6)
        signs="\033[30m" ;;

esac

case "$2" in
    1)
        back="\033[107m" ;;
    2)
        back="\033[101m" ;;
    3)
        back="\033[41m" ;;
    4)
        back="\033[104m" ;;
    5)
        back="\033[45m" ;;
    6)
        back="\033[40m" ;;

esac
echo -e " ${signs}${back}hjkkbfs${signs}${back} "

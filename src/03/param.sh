#!/bin/bash
# 1 \033[97m	\033[107m
# 2 \033[91m	\033[101m
# 3 \033[92m	\033[41m
# 4 \033[94m	\033[104m
# 5 \033[35m    \033[45m 
# 6 \033[30m    \033[40m
# if [ "$1" -eq "$b" ]


get_sign_color() {
    case "$1" in
        1) echo "\033[97m" ;;  
        2) echo "\033[91m" ;;  
        3) echo "\033[92m" ;;  
        4) echo "\033[94m" ;;  
        5) echo "\033[35m" ;;  
        6) echo "\033[30m" ;;  
        *) echo "\033[0m"  ;;  
    esac
}


get_background_color() {
    case "$1" in
        1) echo "\033[107m" ;; 
        2) echo "\033[101m" ;; 
        3) echo "\033[41m"  ;; 
        4) echo "\033[104m" ;; 
        5) echo "\033[45m"  ;; 
        6) echo "\033[40m"  ;; 
        *) echo "\033[0m"   ;; 
    esac
}


signs=$(get_sign_color "$1")
back=$(get_background_color "$2")
signs1=$(get_sign_color "$3")
back1=$(get_background_color "$4")


chmod +x info.sh
bash ./info.sh "${signs}${back}" "${signs1}${back1}"

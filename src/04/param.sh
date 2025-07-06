#!/bin/bash
# 1 \033[97m	\033[107m
# 2 \033[91m	\033[101m
# 3 \033[92m	\033[41m
# 4 \033[94m	\033[104m
# 5 \033[35m    \033[45m 
# 6 \033[30m    \033[40m
# if [ "$1" -eq "$b" ]

default_column1_background=6  # Чёрный
default_column1_font_color=1   # Белый
default_column2_background=2   # Красный
default_column2_font_color=4   # Синий

CONFIG_FILE="config.conf"

if [[ -f "$CONFIG_FILE" ]]; then
    source "$CONFIG_FILE"
fi

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


# name_color() {
#     case "$1" in
#     "\033[97m"|"\033[107m") echo "white" ;;
#     "\033[91m"|"\033[101m") echo "red" ;;
#     "\033[92m"|"\033[41m" ) echo "green" ;;
#     "\033[94m"|"\033[104m") echo "blue" ;;
#     "\033[35m"|"\033[45m" ) echo "purple" ;;
#     "\033[30m"|"\033[40m" ) echo "black" ;;

#     esac
# }

name_color() {

    case "$1" in
        1) echo "white" ;;
        2) echo "red" ;;
        3) echo "green" ;;
        4) echo "blue" ;;
        5) echo "purple" ;;
        6) echo "black" ;;
        *) echo  "default" ;;
    esac
}
# 
#

column1_font_color=${column1_font_color:-$default_column1_font_color}
column1_background=${column1_background:-$default_column1_background}
column2_font_color=${column2_font_color:-$default_column2_font_color}
column2_background=${column2_background:-$default_column2_background}


#name=$(echo -e "Column 1 background = ${column1_background:-default} ($(name_color "$column1_background"))\
#Column 1 font color = ${column1_font_color:-default} ($(name_color "$column1_font_color")) \n Column 2 background = ${column2_background:-default} ($(name_color "$column2_background"))\nColumn 2 font color = ${column2_font_color:-default} ($(name_color "$column2_font_color"))")
name="Column 1 background = ${column1_background:-default} ($(name_color "$column1_background")) \n
Column 1 font color = ${column1_font_color:-default} ($(name_color "$column1_font_color")) \n
Column 2 background = ${column2_background:-default} ($(name_color "$column2_background")) \n
Column 2 font color = ${column2_font_color:-default} ($(name_color "$column2_font_color"))\n " 




column1_font_color=${column1_font_color:-$default_column1_font_color}
column1_background=${column1_background:-$default_column1_background}
column2_font_color=${column2_font_color:-$default_column2_font_color}
column2_background=${column2_background:-$default_column2_background}

signs=$(get_sign_color "$column1_font_color")
back=$(get_background_color "$column1_background")
signs1=$(get_sign_color "$column2_font_color")
back1=$(get_background_color "$column2_background")

# chmod +x info.sh
dir=$(dirname "$0")
bash $dir/info.sh "${signs}${back}" "${signs1}${back1}"

echo -e  $name
# echo ""
# echo "Column 1 background = ${column1_background:-default} ($(name_color "$column1_background"))"
# echo "Column 1 font color = ${column1_font_color:-default} ($(name_color "$column1_font_color"))"
# echo "Column 2 background = ${column2_background:-default} ($(name_color "$column2_background"))"
# echo "Column 2 font color = ${column2_font_color:-default} ($(name_color "$column2_font_color"))"

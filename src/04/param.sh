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

column1_font_color=${column1_font_color:-$default_column1_font_color}
column1_background=${column1_background:-$default_column1_background}
column2_font_color=${column2_font_color:-$default_column2_font_color}
column2_background=${column2_background:-$default_column2_background}

signs=$(get_sign_color "$column1_font_color")
back=$(get_background_color "$column1_background2")
signs1=$(get_sign_color "$column2_font_color")
back1=$(get_background_color "$column2_background")


chmod +x info.sh
bash ./info.sh "${signs}${back}" "${signs1}${back1}"

echo ""

echo "Column 1 background = ${column1_background:-default} ($(get_background_color "$column1_background"))"
echo "Column 1 font color = ${column1_font_color:-default} ($(get_sign_color "$column1_font_color"))"
echo "Column 2 background = ${column2_background:-default} ($(get_background_color "$column2_background"))"
echo "Column 2 font color = ${column2_font_color:-default} ($(get_sign_color "$column2_font_color"))"

#!/bin/bash


# Функция для проверки допустимости ввода параметров
check_params() {
    if [[ ! $1 =~ ^[1-6]$ ]]; then
        echo "Неверный параметр 1: $1. Должен быть от 1 до 6."
        exit 1
    fi
    if [[ ! $2 =~ ^[1-6]$ ]]; then
        echo "Неверный параметр 2: $2. Должен быть от 1 до 6."
        exit 1
    fi
    if [[ ! $3 =~ ^[1-6]$ ]]; then
        echo "Неверный параметр 3: $3. Должен быть от 1 до 6."
        exit 1
    fi
    if [[ ! $4 =~ ^[1-6]$ ]]; then
        echo "Неверный параметр 4: $4. Должен быть от 1 до 6."
        exit 1
    fi
}

# Функция для преобразования чисел в коды цветов
get_color_code() {
    case $1 in
        1) echo -n "\e[37m";; # белый
        2) echo -n "\e[31m";; # красный
        3) echo -n "\e[32m";; # зеленый
        4) echo -n "\e[34m";; # синий
        5) echo -n "\e[35m";; # фиолетовый
        6) echo -n "\e[30m";; # черный
    esac
}

# Функция для сброса цвета к стандартному
reset_color() {
    echo -en "\e[0m"
}

# Проверка параметров
check_params $1 $2 $3 $4

# Проверяем, что цвета фона и текста не совпадают
if [ $1 == $2 ]; then
    echo "Ошибка: Цвет фона ($1) и цвет текста ($2) названия значений совпадают!"
    echo "Пожалуйста, запустите скрипт снова с другими значениями."
    exit 1
fi

if [ $3 == $4 ]; then
    echo "Ошибка: Цвет фона ($3) и цвет текста ($4) значений совпадают!"
    echo "Пожалуйста, запустите скрипт снова с другими значениями."
    exit 1
fi

# Определяем переменные для хранения кодов цветов
bg_label=$(get_color_code $1)
fg_label=$(get_color_code $2)
bg_value=$(get_color_code $3)
fg_value=$(get_color_code $4)

# Основная часть скрипта
date=$(date "+%d %b %Y %T")
timezone=$(cat /etc/timezone)
uptime_in_seconds=$(awk '{print $1}' /proc/uptime)
mask=$(ip addr show dev eth0 | grep -Po '(?<=netmask )\d+\.\d+\.\d+\.\d+')
gateway=$(ip route | awk '/default/ {print $3}')
ram_total_kb=$(free -k | awk '/Mem:/ { print $2 }')
ram_total_gb=$(bc <<< "scale=3; $ram_total_kb / 1048576")
ram_used_kb=$(free -k | awk '/Mem:/ { print $3 }')
ram_used_gb=$(bc <<< "scale=3; $ram_used_kb / 1048576")
ram_free_kb=$(free -k | awk '/Mem:/ { print $4 }')
ram_free_gb=$(bc <<< "scale=3; $ram_free_kb / 1048576")
# Получаем информацию о корневом разделе
df_output=$(df -Bm / | tail -1)

# Извлекаем общий размер, занятое пространство и свободное пространство
total_space_mb=$(echo "$df_output" | awk '{print $2}')
used_space_mb=$(echo "$df_output" | awk '{print $3}')
free_space_mb=$(echo "$df_output" | awk '{print $4}')

# Формируем итоговые значения с точностью до двух знаков после запятой
total_space_mb_formatted=$(printf "%.2f MB" "$((total_space_mb / 1000))")
used_space_mb_formatted=$(printf "%.2f MB" "$((used_space_mb / 1000))")
free_space_mb_formatted=$(printf "%.2f MB" "$((free_space_mb / 1000))")

# Выводим данные с учетом заданных цветов
echo -e "${bg_label}${fg_label}HOSTNAME:${reset_color} $HOSTNAME"
echo -e "${bg_label}${fg_label}TIMEZONE:${reset_color} $timezone UTC $(date +"%z")"
echo -e "${bg_label}${fg_label}USER:${reset_color} $(whoami)"
echo -e "${bg_label}${fg_label}OS:${reset_color} $(uname -rs)"
echo -e "${bg_label}${fg_label}DATE:${reset_color} $date"
echo -e "${bg_label}${fg_label}UPTIME:${reset_color} $(uptime -p)"
echo -e "${bg_label}${fg_label}UPTIME_SEC:${reset_color} $uptime_in_seconds"
echo -e "${bg_label}${fg_label}IP:${reset_color} $(hostname -I)"
echo -e "${bg_label}${fg_label}MASK:${reset_color} $mask"
echo -e "${bg_label}${fg_label}GATEWAY:${reset_color} $gateway"
echo -e "${bg_label}${fg_label}RAM_TOTAL:${reset_color} $ram_total_gb GB"
echo -e "${bg_label}${fg_label}RAM_USED:${reset_color} ${ram_used_gb} GB"
echo -e "${bg_label}${fg_label}RAM_FREE:${reset_color} ${ram_free_gb} GB"
echo -e "${bg_label}${fg_label}SPACE_ROOT:${reset_color} $total_space_mb_formatted"
echo -e "${bg_label}${fg_label}SPACE_ROOT_USED:${reset_color} $used_space_mb_formatted"
echo -e "${bg_label}${fg_label}SPACE_ROOT_FREE:${reset_color} $free_space_mb_formatted"
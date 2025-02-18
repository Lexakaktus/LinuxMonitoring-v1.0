#!/bin/bash

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


echo "HOSTNAME: $HOSTNAME"
echo "TIMEZONE = $timezone UTC $(date +"%z")"
echo "USER: $(whoami)"
echo "OS: $(uname -rs)"
echo "DATE: $date"
echo "UPTIME: $(uptime -p)"
echo "UPTIME_SEC: $uptime_in_seconds"
echo "IP: $(hostname -I)"
echo "MASK = $mask"
echo "GATEWAY = $gateway"
echo "RAM_TOTAL = $ram_total_gb GB"
echo "RAM_USED = ${ram_used_gb} GB"
echo "RAM_FREE = ${ram_free_gb} GB"
echo "SPACE_ROOT = $total_space_mb_formatted"
echo "SPACE_ROOT_USED = $used_space_mb_formatted"
echo "SPACE_ROOT_FREE = $free_space_mb_formatted"

# Предложение сохранить данные в файл
read -p "Do you want to save this information to a file? (Y/n): "

# Проверка ответа пользователя
if [[ $REPLY =~ ^[Yy]$ ]]
then
  filename="$(date '+%d_%m_%y_%H_%M_%S').status"
  echo "Saving data to $filename..."

  cat <<EOF > "$filename"
HOSTNAME = $HOSTNAME
TIMEZONE = $timezone UTC $(date +"%z")
USER = $user
OS = $os
DATE = $date
UPTIME = $uptime
UPTIME_SEC = $uptime_sec
IP = $ip
MASK = $mask
GATEWAY = $gateway
RAM_TOTAL = $ram_total_formatted
RAM_USED = $ram_used_formatted
RAM_FREE = $ram_free_formatted
SPACE_ROOT = $space_root_formatted
SPACE_ROOT_USED = $space_root_used_formatted
SPACE_ROOT_FREE = $space_root_free_formatted
EOF
else
  echo "Data will not be saved."
fi
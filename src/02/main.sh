#!/bin/bash
output=$(
echo "HOSTNAME =" $HOSTNAME
echo "TIMEZONE = `cat /etc/timezone `  UTC ` date +\"%-:::z\" `"
echo "USER = " $USER
echo "OS = " `cat /etc/issue`
timsave=$( date +"%d_%m_%y_%H_%M_%S")
timsave="${timsave}.status"
echo "DATE = ` date +\"%d %B %Y %T\"` "
echo "UPTIME = `uptime -p` "
echo "UPTIME_SEC =  `awk '{print $1}' /proc/uptime` "
ipper=$(ip -o -4 addr show | tail -n 1 | awk '{print $4}')

echo "IP = $(ip -o -4 addr show | tail -n 1 | awk '{print $4, "(" $2 ")"}')"


echo "MASK = `ipcalc $ipper | awk '/Netmask/ {print $2}'` "
echo "GATEWAY = $(ip r | awk '/default/{print$3}') "
echo "RAM_TOTAL=$(free -m | awk '/^Mem:/ {printf "%.3f GB", $2 / 1024}')"
echo "RAM_USED=$(free -m | awk '/^Mem:/ {printf "%.3f GB", ($2 - $7) / 1024}')"
echo "RAM_FREE=$(free -m | awk '/^Mem:/ {printf "%.3f GB", $7 / 1024}')"
echo "SPACE_ROOT=$(df / --block-size=M | awk '/\// {printf "%.2f MB", $2}')"
echo "SPACE_ROOT_USED=$(df / --block-size=M | awk '/\// {printf "%.2f MB", $3}')"
echo "SPACE_ROOT_FREE=$(df / --block-size=M | awk '/\// {printf "%.2f MB", $4}')"
)

echo "$output"
echo "Вы хотите сохранить данные в файл? Y/n"
read answer
if [[ "$answer" =~ [Yy] ]]
then
echo "$output" > "$timsave"
echo "Данные созранены в файл $timsave"
else
echo "Данные не сохранены"
fi
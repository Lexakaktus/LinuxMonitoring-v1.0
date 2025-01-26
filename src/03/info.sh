#!/bin/bash
color1="$1"
color2="$2"
echo -e "${color1}HOSTNAME =\033[0m" ${color2}$HOSTNAME "\033[0m"
echo -e "${color1}TIMEZONE =\033[0m ${color2} `cat /etc/timezone `  UTC ` date +\"%-:::z\" `" "\033[0m"
echo -e "${color1}USER =\033[0m " ${color2}$USER "\033[0m"
echo -e "${color1}OS =\033[0m ${color2} `lsb_release -ds` \033[0m"
echo -e "${color1}DATE =\033[0m ${color2} ` date +\"%d %B %Y %T\"` " "\033[0m"
echo -e "${color1}UPTIME =\033[0m ${color2} `uptime -p` " "\033[0m"
echo -e "${color1}UPTIME_SEC =\033[0m ${color2}  `awk '{print $1}' /proc/uptime` " "\033[0m"
ipper=$(ip -o -4 addr show | tail -n 1 | awk '{print $4}') 

echo -e "${color1}IP =\033[0m ${color2}$(ip -o -4 addr show | tail -n 1 | awk '{print $4, "(" $2 ")"}')" "\033[0m"


echo -e "${color1}MASK =\033[0m ${color2}`ipcalc $ipper | awk '/Netmask/ {print $2}'` " "\033[0m"
echo -e "${color1}GATEWAY =\033[0m ${color2}$(ip r | awk '/default/{print$3}') " "\033[0m"
echo -e "${color1}RAM_TOTAL=\033[0m ${color2}$(free -m | awk '/^Mem:/ {printf "%.3f GB", $2 / 1024}')" "\033[0m"
echo -e "${color1}RAM_USED=\033[0m ${color2}$(free -m | awk '/^Mem:/ {printf "%.3f GB", ($2 - $7) / 1024}')" "\033[0m"
echo -e "${color1}RAM_FREE=\033[0m ${color2}$(free -m | awk '/^Mem:/ {printf "%.3f GB", $7 / 1024}')" "\033[0m"
echo -e "${color1}SPACE_ROOT=\033[0m ${color2}$(df / --block-size=M | awk '/\// {printf "%.2f MB", $2}')" "\033[0m"
echo -e "${color1}SPACE_ROOT_USED=\033[0m ${color2}$(df / --block-size=M | awk '/\// {printf "%.2f MB", $3}')" "\033[0m"
echo -e "${color1}SPACE_ROOT_FREE=\033[0m ${color2}$(df / --block-size=M | awk '/\// {printf "%.2f MB", $4}')" "\033[0m"

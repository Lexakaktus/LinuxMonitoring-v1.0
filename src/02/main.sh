#!/bin/bash
echo "HOSTNAME =" $HOSTNAME
echo "TIMEZONE = `cat /etc/timezone `  UTC ` date +\"%-:::z\" `"
echo "USER = " $USER
echo "OS = " `cat /etc/issue`
echo "DATE = ` date +\"%d %B %Y %T\"` "
echo "UPTIME = `uptime -p` "
echo " UPTIME_SEC =  `awk '{print $1}' /proc/uptime` "
echo "IP =  ` ip -br -c r `| awk '{print $2}' "

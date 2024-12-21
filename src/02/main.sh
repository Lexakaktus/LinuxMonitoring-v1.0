#!/bin/bash
echo "HOSTNAME =" $HOSTNAME
echo "TIMEZONE = `cat /etc/timezone `  UTC ` date +\"%-:::z\" `"
echo "USER = " $USER
echo "OS = " `cat /etc/issue`
echo "DATE = ` date +\"%d %B %Y %T\"` "

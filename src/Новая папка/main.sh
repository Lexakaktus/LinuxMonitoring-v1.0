#!/bin/bash

if [ -z "$1" ];
then
echo "Error: no argument"
exit 1
fi

if [ -n "$2" ];
then
echo "Error: too many arguments"
exit 1
fi

if [[ "$1" =~ ^[0-9]+$ ]];
then
echo "Error: argument is not a string"
else
echo "$1"
fi
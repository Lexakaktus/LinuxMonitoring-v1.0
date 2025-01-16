#!/bin/bash
if [[ "$1" =~ [A-Za-z] ]]
then
echo $1 
else 
echo "error"
fi

#!/bin/bash
if [[ "$1" =~ [A-z] ]]
then
echo $1 
else 
echo "error"
fi
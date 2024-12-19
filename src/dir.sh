#!/bin/bash
# dir=1
for dir in 1 2 3 4 5 
do 
mkdir 0$dir
cd 0$dir
touch main.sh
cd ..
done
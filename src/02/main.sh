#!/bin/bash
timsave=$( date +"%d_%m_%y_%H_%M_%S").status
chmod +x ./info.sh
output=$( ./info.sh)
echo "$output"
echo "Вы хотите сохранить данные в файл? (Y/n)"
read answer
if [[ "$answer" =~ [Yy] ]]
then
echo "$output" > "$timsave"
echo "Данные сохранены в файл $timsave"
else
echo "Данные не сохранены"
fi
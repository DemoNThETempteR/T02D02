#!/bin/bash

echo "Введите путь и название файла."
read name
if [ -f $name ]
then
echo "Введите текст для замены."
read text
echo "Введите заменяемую строку."
read line
sed -i '' "s/$line/$text/g" $name
else
echo "Файл не найден."
fi

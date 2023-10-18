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
        day=$(ls -lh $name | awk '{print $6}')
        month=$(ls -lh $name | awk '{print $7}')
        case $month in
            янв) month="01" ;;
            фев) month="02" ;;
            мар) month="03" ;;
            апр) month="04" ;;
            май) month="05" ;;
            июн) month="06" ;;
            июл) month="07" ;;
            авг) month="08" ;;
            сен) month="09" ;;
            окт) month="10" ;;
            ноя) month="11" ;;
            дек) month="12" ;;
        esac
        year=$(date -r $name | awk '{print $4}')
        time=$(ls -lh $name | awk '{print $8}')
        size=$(ls -lh $name | awk '{print $5}')
        sum=$(shasum --algorithm 256 $name | awk '{print $1}')
        set -o noclobber
        echo "$name - $size - $year-$month-$day $time - $sum - sha256" >> files.log
else
echo "Файл не найден."
fi

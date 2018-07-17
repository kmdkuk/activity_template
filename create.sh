#!/bin/sh
year=$(date "+%Y")
month=$(date "+%m")
day=$(date "+%d")

if [ ! -e ./$year ]
then
  # yyyyフォルダーが存在しないとき
  mkdir $year
  mkdir $year/$month
fi
if [ ! -e ./$year/$month ]
then
  #mmフォルダーが存在しないとき
  mkdir $year/$month
fi
if [ ! -e ./$year/$month/$day.md ]
then
  cp template.md $year/$month/$day.md
else
  echo "すでに${year}/${month}/${day}.mdファイルはあります"
fi

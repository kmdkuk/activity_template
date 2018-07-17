#!/bin/sh
year=$(date "+%Y")
month=$(date "+%m")
day=$(date "+%d")
filename=$year/$month/$day.md
echo $filename

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
if [ ! -e $filename ]
then
  cp template.md $filename
else
  echo "すでに${filename}ファイルはあります"
fi

sed -i -e "s/yyyy/$year/" $filename
sed -i -e "s/mm/$month/" $filename
sed -i -e "s/dd/$day/" $filename

if [ -e ./$filename-e ]
then
  rm $filename-e
fi

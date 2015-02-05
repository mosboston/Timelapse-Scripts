#!/bin/bash 

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, give a directory name like 2014_12_09"
    exit
fi

cd $1

# sort by exif time
ls -1 *.JPG | while read line
do
	echo `identify -format "%[EXIF:*]" $line | grep -i DateTimeOriginal | cut -d= -f2 ` $line > exif_dates
	echo `identify -format "%[EXIF:*]" $line | grep -i DateTimeOriginal | cut -d= -f2 ` $line 
done


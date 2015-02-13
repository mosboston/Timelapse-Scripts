#!/bin/bash

IFS='\n'       # make newlines the only separator

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, provide a date like 2014_12_09"
    exit
fi

mkdir $1

dropbox_uploader.sh list "Charles River Gallery/$1" | grep JPG | sed -e 's/.*\(IMG_.*JPG\)/\1/' | while read line
do
 dropbox_uploader.sh -s download "Charles River Gallery/$1/$line" $1/$line
done

cd $1
/home/ksimmons/crgcam/find_gaps.sh $1

/home/ksimmons/crgcam/make_vid.sh & 
 

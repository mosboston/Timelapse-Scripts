#!/bin/bash

mkdir pngs

ls -1 *.JPG | while read line
do
	REMOVEDEXTENSION=${line%.JPG}
	REMOVEDPATH=${REMOVEDEXTENSION##*/}
	DESTINATION=$REMOVEDPATH.png
	echo converting and scaling $line to $DESTINATION
	convert $line -resize 1920x1920^ -gravity center -extent 1920x1080 pngs/$DESTINATION
done



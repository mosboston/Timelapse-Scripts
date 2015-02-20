#!/bin/bash

START_FRAME=119890
END_FRAME=120390

DESIRED_WIDTH=5120
DESIRED_HEIGHT=2880
FOLDER_NAME=png-5k

#DESIRED_WIDTH=3840
#DESIRED_HEIGHT=2160
#FOLDER_NAME=png-4k

mkdir $FOLDER_NAME

for i in $(seq ${START_FRAME} ${END_FRAME})
do
	PADDED_COUNTER=`printf "%04d" $i` 
	
	REMOVEDEXTENSION=IMG_${PADDED_COUNTER%.JPG}
	REMOVEDPATH=${REMOVEDEXTENSION##*/}
	DESTINATION=$REMOVEDPATH.png
	echo converting and scaling $REMOVEDEXTENSION.JPG to $DESTINATION
	convert $REMOVEDEXTENSION.JPG -resize ${DESIRED_WIDTH}x${DESIRED_WIDTH}^ -gravity center -extent ${DESIRED_WIDTH}x${DESIRED_HEIGHT} $FOLDER_NAME/$DESTINATION
done
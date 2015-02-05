#!/bin/bash 

STARTNUM=`ls -1 *.JPG | head -n 1 | sed -e "s/[^0-9]//g"`
ENDNUM=`ls -1 *.JPG | tail -n 1 | sed -e "s/[^0-9]//g"`

echo starting at `date` >> gap_log.txt

COUNTER=$STARTNUM
while [ $COUNTER -ne $ENDNUM ]
do
	if [ ! -f IMG_*$COUNTER.JPG ]; then
	    echo "File not found! $COUNTER" >> gap_log.txt
 	    dropbox_uploader.sh -s download "Charles River Gallery/$1/IMG_$COUNTER.JPG" IMG_$COUNTER.JPG >> gap_log.txt
	fi     	

	COUNTER=$[$COUNTER +1]
done

COUNTER=$STARTNUM
while [ $COUNTER -ne $ENDNUM ]
do
	if [ ! -f IMG_*$COUNTER.JPG ]; then
	    echo "File not found again, patching with old frame! $COUNTER" >> gap_log.txt
 	    cp IMG_$[$COUNTER -1].JPG IMG_$COUNTER.JPG >> gap_log.txt
	fi     	

	COUNTER=$[$COUNTER +1]
done

echo ending at `date` >> gap_log.txt


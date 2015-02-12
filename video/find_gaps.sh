#!/bin/bash 

STARTNUM=`ls -1 *.JPG | head -n 1 | sed -e "s/[^0-9]//g"`
ENDNUM=`ls -1 *.JPG | tail -n 1 | sed -e "s/[^0-9]//g"`
LOCALDIR=${PWD##*/}

#echo starting at `date` >> gap_log.txt

echo "`date`: Finding gaps for $LOCALDIR (frames $STARTNUM - $ENDNUM):" >> gap_log.txt

# PROGRESS BAR
echo -ne '|>                      |  (0%)\r'

COUNTER=$STARTNUM
while [ $COUNTER -ne $ENDNUM ]
do
	# padding up to 4 digits should work under most cameras; could be more robust
	PADDED_COUNTER=`printf "%04d" $COUNTER` 
	# does file exist and non-zero?	
	if [ ! -f IMG_*$PADDED_COUNTER.JPG ] || [ ! -s IMG_*$PADDED_COUNTER.JPG ]; then
 	    dropbox_uploader.sh -s download "Charles River Gallery/$LOCALDIR/IMG_$PADDED_COUNTER.JPG" IMG_$PADDED_COUNTER.JPG >> gap_log.txt
	fi     	

	COUNTER=$[$COUNTER +1]
done

# PROGRESS BAR
echo -ne '|============>          |  (50%)\r'

COUNTER=$STARTNUM
while [ $COUNTER -ne $ENDNUM ]
do
	# padding up to 4 digits should work under most cameras; could be more robust
	PADDED_COUNTER=`printf "%04d" $COUNTER` 
	
	if [ ! -f IMG_*$PADDED_COUNTER.JPG ] || [ ! -s IMG_*$PADDED_COUNTER.JPG ]; then
	    echo "`date`: IMG_$PADDED_COUNTER.JPG not found twice, patching with old frame!" >> gap_log.txt
 	    cp -f IMG_$[$PADDED_COUNTER -1].JPG IMG_$PADDED_COUNTER 
	fi     	

	COUNTER=$[$COUNTER +1]
done

# PROGRESS BAR
echo -ne '|=======================|  (100%)\r'
echo -ne '\n'
cat gap_log.txt
#echo ending at `date` >> gap_log.txt


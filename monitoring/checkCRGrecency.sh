#!/bin/bash 

cd /home/ksimmons/crgcam/

# TIME FOR COMPARISON
#FIVEMINUTESAGO=`date --date='5 minutes ago' +'%Y/%m/%d %H:%M:%S'`
FIVEMINUTESAGO=`date --date='45 minutes' +'%Y/%m/%d %H:%M:%S'`

# get most current
dropbox_uploader.sh download "Charles River Gallery/current.jpg"

# get exif time
DATETIMEORIGINAL=`identify -format "%[EXIF:*]" current.jpg | grep -i DateTimeOriginal | cut -d= -f2 | sed -e "s/:/\//" | sed -e "s/:/\//"`

EPOCHFIVEMINUTESAGO=`date --date="$FIVEMINUTESAGO" +%s`
EPOCHDATETIMEORIGINAL=`date --date="$DATETIMEORIGINAL" +%s`

# is it recent?
if [ $EPOCHDATETIMEORIGINAL -gt $EPOCHFIVEMINUTESAGO ]
then 
	echo CRG image is more recent than five minutes ago #| mail -s "crg success" 5852176425@vtext.com
else
	echo "CRG image is old! IMG: $DATETIMEORIGINAL, CMP: $FIVEMINUTESAGO" | mail -s "[CRG] Error Alert!" 5852176425@vtext.com,ksimmons@mos.org,bwilson@mos.org
	echo "CRG image is old!" 
fi

exit



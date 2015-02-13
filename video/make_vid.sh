#!/bin/bash 

STARTNUM=`ls -1 *.JPG | head -n 1 | sed -e "s/[^0-9]//g"`

DESIREDHEIGHT=1080
DESIREDWIDTH=1920
LOCALDIR=${PWD##*/}

DATESTR=`echo $LOCALDIR | sed -e "s/_/\//g"`

HUMANDATE=`date -d "$DATESTR" +"%B %-d, %Y"`

TITLE="Charles River Time-Lapse $HUMANDATE" 

MONTH=`date -d "$DATESTR" +"%-m"`
DAY=`date -d "$DATESTR" +"%-d"`
YEAR=`date -d "$DATESTR" +"%Y"`

URL="http://www.wunderground.com/history/airport/KBOS/$YEAR/$MONTH/$DAY/DailyHistory.html"
IMGURL="http://www.wunderground.com/cgi-bin/histGraphAll?day=$DAY&year=$YEAR&month=$MONTH&ID=KBOS&type=3&width=614"

MOVIE_FILE=$LOCALDIR-h264-${DESIREDHEIGHT}p.mp4
MOVIE_FILE_4K=$LOCALDIR-h264-2160p.mp4
MOVIE_FILE_5K=$LOCALDIR-h264-2880p.mp4

# 2880p: 5120x2880
avconv -threads auto -framerate 30 -start_number $STARTNUM -i IMG_%04d.JPG -vf "scale=5120:ih*5120/iw, crop=5120:2880" -c:v libx264 -r 30 -pix_fmt yuv420p $MOVIE_FILE_5K && 

# 2160p: 3840x2160
#avconv -threads auto -framerate 30 -start_number $STARTNUM -i IMG_%04d.JPG -vf "scale=3840:ih*3840/iw, crop=3840:2160" -c:v libx264 -r 30 -pix_fmt yuv420p $MOVIE_FILE_4K && 

# 1080p: WIDE VERSION
#avconv -threads auto -framerate 30 -start_number $STARTNUM -i IMG_%04d.JPG -vf "scale=$DESIREDWIDTH:ih*$DESIREDWIDTH/iw, crop=$DESIREDWIDTH:$DESIREDHEIGHT" -c:v libx264 -r 30 -pix_fmt yuv420p $MOVIE_FILE && 


# TALL VERSION
#avconv -framerate 30 -start_number $STARTNUM -i IMG_%04d.JPG -vf "scale=1920:ih*1920/iw, crop=1920:1080" -c:v libx264 -r 30 -pix_fmt yuv420p out.mp4

#avconv -framerate 30 -start_number $STARTNUM -i IMG_%04d.JPG -c:v libx264 -r 30 -pix_fmt yuv420p -vf scale=1920:1080 out.mp4
#avconv -framerate 30 -start_number $1 -i IMG_%04d.JPG -c:v libx264 -preset slow -r 30 -pix_fmt yuv420p -vf scale=1920:1080 out.mp4


# upload to youtube
youtube-upload --client-secrets=/home/ksimmons/client_secret_617839306359-smt8910kuh6usp4vtn3i1dfj25b79d5l.apps.googleusercontent.com.json --privacy=unlisted --title="$TITLE" --description="Time-lapse of the Charles River on $HUMANDATE as seen from the Museum of Science, Boston\nWeather History: $URL\nWeather History Graphs: $IMGURL" --location="=" --category="Science & Technology" $MOVIE_FILE_5K >> ~/youtube_urls.txt
 

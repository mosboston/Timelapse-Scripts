#!/bin/bash 

STARTNUM=`ls -1 *.JPG | head -n 1 | sed -e "s/[^0-9]//g"`

DESIREDHEIGHT=1080
DESIREDWIDTH=1920
LOCALDIR=${PWD##*/}

# WIDE VERSION
avconv -framerate 30 -start_number $STARTNUM -i IMG_%04d.JPG -vf "scale=$DESIREDWIDTH:ih*$DESIREDWIDTH/iw, crop=$DESIREDWIDTH:$DESIREDHEIGHT" -c:v libx264 -r 30 -pix_fmt yuv420p $LOCALDIR-h264-${DESIREDHEIGHT}p.mp4

# TALL VERSION
#avconv -framerate 30 -start_number $STARTNUM -i IMG_%04d.JPG -vf "scale=1920:ih*1920/iw, crop=1920:1080" -c:v libx264 -r 30 -pix_fmt yuv420p out.mp4

#avconv -framerate 30 -start_number $STARTNUM -i IMG_%04d.JPG -c:v libx264 -r 30 -pix_fmt yuv420p -vf scale=1920:1080 out.mp4
#avconv -framerate 30 -start_number $1 -i IMG_%04d.JPG -c:v libx264 -preset slow -r 30 -pix_fmt yuv420p -vf scale=1920:1080 out.mp4


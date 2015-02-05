#!/bin/bash 

STARTNUM=`ls -1 *.JPG | head -n 1 | sed -e "s/[^0-9]//g"`

#avconv -framerate 30 -start_number $STARTNUM -i IMG_%04d.JPG -vf "scale=1920:ih*1920/iw, crop=1920:1080" -c:v libx264 -r 30 -pix_fmt yuv420p out.mp4
avconv -framerate 30 -start_number $STARTNUM -i IMG_%04d.JPG -vf "crop=4324:3648" -c:v prores -qscale:v 9  -r 30 out-bigscreen.mov
#avconv -framerate 30 -start_number $STARTNUM -i IMG_%04d.JPG -vf "crop=4324:3648" -c:v libx265 -r 30 -pix_fmt yuv420p out-bigscreen.mp4
#avconv -framerate 30 -start_number $STARTNUM -i IMG_%04d.JPG -vf "crop=4324:3648" -c:v libx264 -r 30 -pix_fmt yuv420p out-bigscreen.mp4
#avconv -framerate 30 -start_number $STARTNUM -i IMG_%04d.JPG -c:v libx264 -r 30 -pix_fmt yuv420p -vf scale=1920:1080 out.mp4
#avconv -framerate 30 -start_number $1 -i IMG_%04d.JPG -c:v libx264 -preset slow -r 30 -pix_fmt yuv420p -vf scale=1920:1080 out.mp4


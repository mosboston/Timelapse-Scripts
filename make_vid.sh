#!/bin/bash 

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, provide a number for start frame"
    exit
fi

avconv -framerate 30 -start_number $1 -i IMG_%04d.JPG -c:v libx264 -r 30 -pix_fmt yuv420p -vf scale=1920:1080 out.mp4


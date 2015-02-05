#!/bin/bash

CURRENT_LINK=https://www.dropbox.com/s/pw0hdufj5pbbzij/current.jpg?dl=1

wget -O /home/ksimmons/current.jpg $CURRENT_LINK 
convert /home/ksimmons/current.jpg -resize "1920x1080^" -gravity center -crop 1920x1080+0+0 +repage /home/ksimmons/screensaver/images/current_scaled.jpg 
DISPLAY=:0.0 fbsetbg /home/ksimmons/screensaver/images/current_scaled.jpg


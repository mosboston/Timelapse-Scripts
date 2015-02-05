#!/bin/bash

cd /cygdrive/c/Users/crg/Pictures

MOST_RECENT_DIR=`ls -1t --group-directories-first | head -n 1`
MOST_RECENT_IMG=`ls -1t $MOST_RECENT_DIR/*.JPG | head -n 1`

dropbox_uploader.sh upload "$MOST_RECENT_IMG" "Charles River Gallery/current.jpg"


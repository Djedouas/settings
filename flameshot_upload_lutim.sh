#!/bin/bash

# lutim_instance="https://wtf.roflcopter.fr/pics/"
lutim_instance="https://lutim.anartist.org/"

# Save image from clipboard to temp file
rm /tmp/capture.png
xclip -selection c -t image/png -o > /tmp/capture.png

# Upload image for 1 day to lutim service and read json response
url=$(curl -F "format=json" -F "file=@/tmp/capture.png" -F "delete-day=1" $lutim_instance | \
  python -c "import sys, json; print(sys.argv[1] + json.load(sys.stdin)['msg']['short'], end='')" $lutim_instance)

# Notify user
[ $? -eq 0 ] && notify-send "Success" || notify-send -u critical "Command unsuccessful"

# Put url into clipboard
echo $url | xclip -selection c

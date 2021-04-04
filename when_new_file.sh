#!/bin/bash
# the script always expects math.jpg to be uploaded to image directory

inotifywait -m image -e create -e moved_to |
    while read path action file; do
        sleep 5
        echo "The file '$file' appeared in directory '$path' via '$action'"
        python3 mathpix image/math.jpg > output/output.txt
        echo 'Sending math.jpg and output.txt to website'
        gsutil cp image/math.jpg gs://www.checkyourself.space
        gsutil cp output/output.txt gs://www.checkyourself.space
        echo 'Sending complete'
        rm image/math.jpg
        echo "math.jpg was removed"
    done

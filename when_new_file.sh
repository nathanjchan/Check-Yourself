#!/bin/bash

inotifywait -m ~/images -e create -e moved_to |
    while read path action file; do
        echo "The file '$file' appeared in directory '$path' via '$action'"
        # do something with the file
        python ~/mathpix ~/images/$file > ~/output/${file}_output.txt
    done

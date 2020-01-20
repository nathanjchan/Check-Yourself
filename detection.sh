#!/bin/bash

while true; do
    sleep 1
    echo 'Retrieving math.jpg from Firebase'
    gsutil cp gs://hackdavis2020.appspot.com/images/math.jpg image
    echo 'Retrieving complete'
done

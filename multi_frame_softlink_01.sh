#!/bin/bash

input_file="gacos_bad_frames.txt"

while IFS= read -r frame; do
    # Check if the directory exists
    if [ ! -d "$frame" ]; then
        echo "Creating directory for $frame"
        mkdir "$frame"
    else
        echo "Directory for $frame already exists"
    fi

    cd $frame
    ./../LiCSBAS01_JM_softlink_dates.sh $frame
    cd ..

    
done < "$input_file"



#!/bin/bash

input_file="gacos_broken_frames.txt"

while IFS= read -r frame; do

    # Input and output file paths
    input="${frame}/GEOCml10GACOS/GACOS_info.txt"
    output="${frame}/GEOCml10GACOS/GACOS_info_corr.txt"
    # Replace 'inf' with 'nan' in the input file and save to output file
    sed 's/inf/nan/g' "$input" > "$output"

    # Remove the original input file
    rm "$input"
    # Rename the temporary file to the original input file name
    mv "$output" "$input"

    echo "Replacement complete and file renamed."

done < "$input_file"



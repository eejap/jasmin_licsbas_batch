#!/bin/bash

input_file="frames.txt"

while IFS= read -r frame; do
    
    cd $frame
    pwd
    sbatch -p par-single -o ../sbatch_logs/LiCSBAS_flt2geotiff/$frame.out -e ../sbatch_logs/LiCSBAS_flt2geotiff/$frame.err -t 00:30:00 --mem=5GB --ntasks 1 --cpus-per-task 4 ./../convert_commands_new_frames_no_clip.sh
    cd ..

done < "$input_file"

#input_file2="frames_high_res.txt"

#while IFS= read -r frame; do

#    cd $frame
#    pwd
#    sbatch -p par-single -o ../sbatch_logs/LiCSBAS_flt2geotiff/$frame.out -e ../sbatch_logs/LiCSBAS_flt2geotiff/$frame.err -t 00:30:00 --mem=5GB --ntasks 1 --cpus-per-task 4 ./../convert_commands_new_frames_no_clip_ml20.sh
#    cd ..

#done < "$input_file2"


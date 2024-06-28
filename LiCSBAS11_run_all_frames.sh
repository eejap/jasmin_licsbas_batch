#!/bin/bash

input_file="071A_05638_131313.txt"

while IFS= read -r frame; do

    cd $frame
    pwd
    sbatch -p par-single -o ../sbatch_logs/batch_LiCSBAS_11_no_clip_$frame.out -e ../sbatch_logs/batch_LiCSBAS_11_no_clip_$frame.err -t 2:00:00 --mem=10GB --ntasks 1 --cpus-per-task 3 ./../batch_LiCSBAS_11_new_frames_no_clip.sh
    cd ..

done < "$input_file"

#input_file2="frames_high_res.txt"

#while IFS= read -r frame; do

#    cd $frame
#    pwd
#    sbatch -p par-single -o ../sbatch_logs/batch_LiCSBAS_11_no_clip_ml20_$frame.out -e ../sbatch_logs/batch_LiCSBAS_11_no_clip_ml20_$frame.err -t 2:00:00 --mem=10GB --ntasks 1 --cpus-per-task 3 ./../batch_LiCSBAS_11_new_frames_no_clip_high_res.sh
#    cd ..

#done < "$input_file2"



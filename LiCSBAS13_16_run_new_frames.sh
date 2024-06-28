#!/bin/bash

input_file="071A_05638_131313.txt"

while IFS= read -r frame; do

    cd $frame
    pwd
    sbatch -p par-single -o ../sbatch_logs/LiCSBAS13_16/batch_LiCSBAS_13_16_no_clip_$frame.out -e ../sbatch_logs/LiCSBAS13_16/batch_LiCSBAS_13_16_no_clip_$frame.err -t 5:00:00 --mem=40GB --ntasks 1 --cpus-per-task 4 ./../batch_LiCSBAS_13_16_new_frames_no_clip_ml10.sh
    cd ..

done < "$input_file"

#input_file2="frames_high_res.txt"

#while IFS= read -r frame; do

#    cd $frame
#    pwd
#    sbatch -p par-single -o ../sbatch_logs/LiCSBAS13_16/batch_LiCSBAS_13_16_no_clip_$frame.out -e ../sbatch_logs/LiCSBAS13_16/batch_LiCSBAS_13_16_no_clip_$frame.err -t 4:00:00 --mem=20GB --ntasks 1 --cpus-per-task 4 ./../batch_LiCSBAS_13_16_new_frames_no_clip_ml20.sh
#    cd ..

#done < "$input_file2"

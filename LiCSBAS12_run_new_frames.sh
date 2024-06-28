#!/bin/bash

input_file="071A_05638_131313.txt"

while IFS= read -r frame; do

    cd $frame
    pwd
    sbatch -p par-single -o ../sbatch_logs/batch_LiCSBAS_12_no_clip_${frame}_1km.out -e ../sbatch_logs/batch_LiCSBAS_12_no_clip_${frame}_1km.err -t 2:00:00 --mem=20GB --ntasks 1 --cpus-per-task 4 ./../LiCSBAS12_new_frames_no_clip_ml10.sh
    cd ..

done < "$input_file"

#input_file2="frames_high_res.txt"

#while IFS= read -r frame; do

#    cd $frame
#    pwd
#    sbatch -p par-single -o ../sbatch_logs/batch_LiCSBAS_12_no_clip_ml20_${frame}_100m.out -e ../sbatch_logs/batch_LiCSBAS_12_no_clip_ml20_${frame}_100m.err -t 2:00:00 --mem=20GB --ntasks 1 --cpus-per-task 4 ./../LiCSBAS12_new_frames_no_clip_ml20.sh
#    cd ..

#done < "$input_file2"

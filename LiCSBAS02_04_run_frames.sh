#!/bin/bash

#input_file="frames_high_res.txt"

#while IFS= read -r frame; do

#    cd $frame
#    sbatch -p par-single -o ../sbatch_logs/batch_LiCSBAS_02_04_high_res_${frame}_100m.out -e ../sbatch_logs/batch_LiCSBAS_02_04_high_res_${frame}_100m.err -t 8:00:00 --mem=60GB --ntasks 1 --cpus-per-task 6 ./../batch_LiCSBAS_02_04_high_res_frames.sh
#    cd ..

#done < "$input_file"

input_file="gacos_bad_frames.txt"

while IFS= read -r frame; do

    cd $frame
    sbatch -p par-single -o ../sbatch_logs/batch_LiCSBAS_02_04_low_res_${frame}_1km.out -e ../sbatch_logs/batch_LiCSBAS_02_04_low_res_${frame}_1km.err -t 8:00:00 --mem=60GB --ntasks 1 --cpus-per-task 6 ./../batch_LiCSBAS_02_04_low_res_frames.sh
    cd ..

done < "$input_file"


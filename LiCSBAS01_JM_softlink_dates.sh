#!/bin/bash

FRAME="${1}"
TRACK="$(echo $FRAME | cut -c1-3 | bc)"
FRAMEdir="$LiCSAR_public/$TRACK/$FRAME"
threshold_date="20141001"
threshold_date2="20231231"

mkdir -p GEOC
cd GEOC

# Copy interferograms
for dir in $(ls $FRAMEdir/interferograms/); do
    file_dates="$dir"
    file_date1=$(echo $file_dates | cut -d '_' -f 1)
    file_date2=$(echo $file_dates | cut -d '_' -f 2)
    
    if [[ $file_date1 -gt $threshold_date && $file_date2 -gt $threshold_date && $file_date2 -lt $threshold_date2 && $file_date1 -lt $threshold_date2  ]]; then
        ln -sf "$FRAMEdir/interferograms/$dir" ./
    fi
done


# Copy single geo.mli.tif file
rm -rf ./*geo.mli.tif
cp $(ls $FRAMEdir/epochs/20*/*.geo.mli.tif | head -1) ./${FRAME}.geo.mli.tif

# Copy other metadata files
cp -f $FRAMEdir/metadata/*geo.[ENU].tif ./
cp -f $FRAMEdir/metadata/*geo.hgt.tif ./
cp -f $FRAMEdir/metadata/baselines ./

cd ..

mkdir -p GACOS
cd GACOS

# Copy sltd.geo.tif files
for epoch in $(ls $FRAMEdir/epochs); do
    if [ -n "$(ls $FRAMEdir/epochs/$epoch/*sltd.geo.tif 2>/dev/null)" ]; then
        epoch_dates=$(basename $epoch | cut -d '.' -f 1)
        epoch_dates=$(echo $epoch_dates | tr -d '_')
        
        ln -sf $FRAMEdir/epochs/$epoch/20*.sltd.geo.tif ./
     fi
done

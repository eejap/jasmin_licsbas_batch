#!/bin/bash

ts_dir="TS_GEOCml10GACOSmask"
geoc_dir="GEOCml10GACOSmask"

mkdir $ts_dir/tifs

LiCSBAS_flt2geotiff.py -i $ts_dir/results/vel -p $geoc_dir/EQA.dem_par -o $ts_dir/tifs/vel.geo.tif
LiCSBAS_flt2geotiff.py -i $ts_dir/results/vel.filt -p $geoc_dir/EQA.dem_par -o $ts_dir/tifs/vel.filt.geo.tif
LiCSBAS_flt2geotiff.py -i $ts_dir/results/vstd -p $geoc_dir/EQA.dem_par -o $ts_dir/tifs/vstd.geo.tif
LiCSBAS_flt2geotiff.py -i $ts_dir/results/mask -p $geoc_dir/EQA.dem_par -o $ts_dir/tifs/mask.geo.tif
LiCSBAS_flt2geotiff.py -i $geoc_dir/E.geo -p $geoc_dir/EQA.dem_par -o $ts_dir/tifs/E.geo.tif
LiCSBAS_flt2geotiff.py -i $geoc_dir/N.geo -p $geoc_dir/EQA.dem_par -o $ts_dir/tifs/N.geo.tif
LiCSBAS_flt2geotiff.py -i $geoc_dir/U.geo -p $geoc_dir/EQA.dem_par -o $ts_dir/tifs/U.geo.tif


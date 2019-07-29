#!/bin/bash
### gronyn.R
### 
### This file is part of Gronyn.
### 
### Copyright (C) 2019 Ellis Rhys Thomas
###
### Gronyn is free software: you can redistribute it and/or modify
### it under the terms of the GNU General Public License as published by
### the Free Software Foundation, either version 3 of the License, or
### (at your option) any later version.
###
### libwsepd is distributed in the hope that it will be useful,
### but WITHOUT ANY WARRANTY; without even the implied warranty of
### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
### GNU General Public License for more details.
###
### You should have received a copy of the GNU General Public License
### along with libwsepd.  If not, see <https://www.gnu.org/licenses/>.
###
### Description:
###
### MMC statistical sterological analysis software.
###
### Dependencies:
### 
### R (spatstat), GNU octave, ImageMagick, mupdf.
###
###

set -euo pipefail
source "./src/gron_misc.sh"

# Generate a unique string to be used for the analysis and ensure that
# the supplied path to file exists
micrograph_filename="$1"

gron_test_file "$micrograph_filename"
analysis_uid=$(gron_uid)

# Copy into unique directory, convert the file into standard greyscale
# bitmap format. This should fail if ImageMagick determines the file
# is invalid format.
analysis_dir="./analysis/${analysis_uid}"
bitmap_filename="${analysis_dir}/${analysis_uid}.sem.bmp"

mkdir -p "$analysis_dir/"
convert "$micrograph_filename" \
	-set colorspace gray -separate -average \
	"$bitmap_filename"

# Crop the image interactively and save a greyscale bitmap
cropped_filename="${analysis_dir}/${analysis_uid}.crop.bmp"

./script/gron_interactive_crop.m "$bitmap_filename" "$cropped_filename"

# Threshold the image and save a monochrome bitmap


exit 0

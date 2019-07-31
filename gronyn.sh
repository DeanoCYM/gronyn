#!/bin/bash

### Author: Ellis Rhys Thomas <e.rhys.thomas@gmail.com>
### Script: gronyn.sh v0.1
### Date: 30/07/2019
### Depends: Bash, R (spatstat), GNU octave, ImageMagick, mupdf, util-linux
###          md5sum, core-utils.

## This file is part of Gronyn.
## 
## Copyright (C) 2019 Ellis Rhys Thomas
##
## Gronyn is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## Gronyn is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Gronyn.  If not, see <https://www.gnu.org/licenses/>.

###
### Description: Metal matrix composite statistical sterological
### particle analysis.
###  
### Usage: ./gronyn.sh [-i] FILE ...
###
### Options: -i   Interactive mode (Not yet implemented).
###

set -euo pipefail
export PATH="$PATH:./script/"
source "./src/gron_misc.sh"
source "./src/gron_magick.sh"
source "./src/gron_filemanager.sh"

## Print usage information
function gron_usage () {
    echo "$(sed -ne 's/^### //p' < gronyn.sh)"
    gron_die "Invalid usage"
}

## Analysis directory to save results
gron_analysis_dir=$(realpath "./analysis")

## Process arguements
while getopts ":ih" opt ; do
    case ${opt} in
	i  )			# interactive mode
	    gron_die "Interactive mode is not implemented yet."
	    ;;
	h  )			# print help
	    gron_usage
	     ;;
	\? )			# unrecognised option
	    gron_usage
	     ;;
    esac
done

shift $((OPTIND -1))		# remove cli options from argv

[ -d "$gron_analysis_dir" ] || mkdir "$gron_analysis_dir"

## Analyse each micrograph
for micrograph in "$@" ; do
    [ -r "$micrograph" ] || break                 # check readable file
    
    id=$(gron_fm_id "$micrograph")		  # generate uid
    gron_fm_create "$id" "$micrograph"		  # start new analysis
    
    gron_interactive_crop.m \
    	$(gron_fm_get "$id" "greyscale") \
    	$(gron_fm_new "$id" "cropped" ".bmp")

    gron_mk_autothreshold \
	$(gron_fm_get "$id" "cropped") \
	$(gron_fm_new "$id" "binary" ".bmp")

    gron_analyse_centroids.m \
	$(gron_fm_get "$id" "binary") \
	$(gron_fm_new "$id" "centroids" ".csv")
    
    

done


exit 0

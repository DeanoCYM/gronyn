#!/bin/bash
### gron_filemanager.sh
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
### Gronyn is distributed in the hope that it will be useful,
### but WITHOUT ANY WARRANTY; without even the implied warranty of
### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
### GNU General Public License for more details.
###
### You should have received a copy of the GNU General Public License
### along with Gronyn.  If not, see <https://www.gnu.org/licenses/>.
###
### Description:
###
### Stores manages metadata and analysis records.
###
### Dependencies:
### 
### R (spatstat), GNU octave (image), ImageMagick, mupdf.
###
###

## gron_fm_id() Generate unique id ##
#
# Parameters: $1      Target filename
#
# Echos:      sdout   Unique id
#             sderr   n/a
#             
# Returns:    0       On success
function gron_fm_id () {
 
    printf $(date -u +"%y-%m-%d_")
    printf $(md5sum "$1" | awk '{ print $1 }')

    return 0
}

## gron_fm_create() Create an environment for analysis  ##
#
# Parameters: $1      Unique ID 
#             $2      Raw Micrograph file
#
# Req Globals:    $gron_analysis_dir
#             
# Returns:    0       On success
#             1       Invalid arguements
function gron_fm_create () {
    [ -d $gron_analysis_dir ]   && \
    [ $# -eq 2 ]                && \
    [ -n $1 ]                   && \
    [ -r $2 ]                      \
    || return 1

    # Generate new metadata file based on uid
    echo -n "Gronyn Particle Analysis " \
	 > "${gron_analysis_dir}/${1}"
    echo "($(sed -ne 's/^### Script: //p' < gronyn.sh))" \
	 >> "${gron_analysis_dir}/${1}"

    # Copy raw image into directory as a bitmap file
    newfile=$(gron_fm_new "$1" "greyscale" ".bmp")
    gron_mk_greyscale "$2" "$newfile"

    return 0
}

## gron_fm_new() Generate new tag and append to logfile ##
#
# Parameters: $1      Unique ID 
#             $2      Descriptive string (tag)
#             $2      File format extension e.g. '.bmp'
#
# Req Globals:        $gron_analysis_dir
#
# Echos:              Path for new analysis
#             
# Returns:    0       On success
#             1       Invalid arguements
function gron_fm_new () {
    [ -d $gron_analysis_dir ]   && \
    [ $# -eq 3 ]                && \
    [ -n $1 ]                   && \
    [ -n $2 ]                   && \
    [ -n $3 ]                      \
    || return 1

    newfile="${gron_analysis_dir}/${1}_${2}${3}"
    echo "$newfile" >> "${gron_analysis_dir}/${1}"
    echo "$newfile"
    touch "$newfile"
    
    return 0
}
    
## gron_fm_get() Retrieve path to files with matching and id tag ##
#
# Parameters: $1      Unique ID
#             $2      Tag string
#
#
# Returns:    0       On success
#             1       Invalid arguements
function gron_fm_get () {
    [ -d $gron_analysis_dir ]   && \
    [ -n $1 ]                   && \
    [ -n $2 ]                      \
	|| return 1

    sed -ne "/$2/p" < "${gron_analysis_dir}/${1}"

    return 0

}    
    

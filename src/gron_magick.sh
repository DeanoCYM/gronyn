#!/bin/bash

### gron_apply_threshold.sh
### 
### This file is part of Gronyn.

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
### Description: ImageMagick scripts used by Gronyn.
###
### Usage: function() INPUT_IMAGE OUTPUT_IMAGE
###
### Dependencies:
### 
### ImageMagick
###
###

## gron_mk_grayscale() Turn to greyscale  ##
#
# Parameters: $1      Target file
#             $2      Output file
#
# Returns:    0       On success
#             1       Invalid arguements
function gron_mk_greyscale () {
    [ $# -eq 2 ]    && [ -r "$1" ]     &&    [ -r "$2" ]    ||  return 1

    convert "$1" -set colorspace gray -separate -average "$2"
    [ $? -eq 0 ] || return 1
    
    return 0
}

## gron_mk_auto() Auto threshold image to monochrome  ##
#
# Parameters: $1      Target file
#             $2      Output file
#
# Returns:    0       On success
#             1       Invalid arguements
function gron_mk_autothreshold () {
    [ $# -eq 2 ] && \
    [ -r "$1" ]  && \
    [ -r "$2" ]     \
	    || return 1

    convert "$1" -auto-threshold 'OTSU' "$2"
    return 0
}

## gron_mk_height() Echo height of image  ##
#
# Parameters: $1      Path to target image file
#
# Returns:    0       On success
#             1       Invalid arguements
function gron_mk_height () {
    [ $# -eq 1 ] || die "Requires one arguement"
    identify -format '%h' "$1" 2>/dev/null
    return 0;
}

## gron_mk_height() Echo width of image  ##
#
# Parameters: $1      Path to target image file
#
# Returns:    0       On success
#             1       Invalid arguements
function gron_mk_width () {
    [ $# -eq 1 ] || die "Requires one arguement"
    identify -format '%w' "$1" 2>/dev/null
    return 0;
}
    

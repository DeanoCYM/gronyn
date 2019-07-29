#!/bin/bash

### gron_apply_threshold.sh
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
### ImageMagick scripts used by gron.
###
### Dependencies:
### 
### ImageMagick
###
###

# Transforms greyscale image at $1 into monochrome image using
# automatically generated threshold value. Threshold is determined
# using OTSU method. New monochrome image is saved to $2.
function gron_autothreshold () {
    gron_test_file "$1"
    convert "$1" -auto-threshold 'OTSU' "$2"
    gron_test_file "$2"
    return 0
}

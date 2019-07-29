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
### Produce monochrome particle map from greyscale image using a
### threshold value.
###
### Dependencies:
### 
### ImageMagick
###
###

set -euo pipefail
source "./src/gron_magick.sh"
source "./src/gron_misc.sh"

cropped_filename="$1"
binary_filename="$2"

gron_autothreshold "$1" "$2"

#!/bin/octave -qf

### Author: Ellis Rhys Thomas <e.rhys.thomas@gmail.com>
### Script: gron_interactive_crop.m
### Date: 31/07/2016
### Depends: GNU octave (image)

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
### Description: Interactive cropping tool, crops the file provided as
### the first paramter and saves it to the file pointed to by the
### second.
###
### Usage: ./gron_interactive_crop INPUT OUTPUT
###
### INPUT   path to greyscale bitmap
### OUTPUT  path to write cropped image
### 

addpath("./src/octave/");
pkg load image

# Retrieve filenames from argv
filenames = argv ();

if length(filenames) != 2
  printf("ERROR: requires two arguements.");
endif

original_filename = filenames{1};
cropped_filename = filenames{2};

# Perform crop 
printf("Select two points to crop between... \n");
image = gron_imread(original_filename);
image = gron_crop(image);
imwrite(image, cropped_filename);

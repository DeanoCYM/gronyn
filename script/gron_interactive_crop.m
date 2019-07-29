#!/bin/octave -qf

### gron_interactive_crop.m
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
### Interactive cropping tool.
###
### Dependencies:
### 
### GNU octave (forge pkgs: image)
###
### Usage:
###
### ./gron_interactive_crop input_path output_path

pkg load image;
addpath("src/octave");

# Retrieve filenames from argv
filenames = argv ();
original_filename = filenames{1};
cropped_filename = filenames{2};

# Perform crop 
printf("Select two points to crop between... ");
image = gron_imread(original_filename);
image = gron_crop(image);
gron_save_bmp(image, cropped_filename);
printf("Success!\nImage written to %s\n", cropped_filename);

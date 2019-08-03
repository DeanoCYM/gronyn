#!/bin/octave -qf

### Author: Ellis Rhys Thomas
### Script: gron_analyse_areas.m
### Date: 30/07/2019
### Depends: image

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
### Description: Area analysis of particles in a monocrome
### bitmap image.
###
### Usage: ./gron_analyse_areas SCALE INPUT OUTPUT
###
### SCALE   pixels per micron
### INPUT   path to greyscale bitmap
### OUTPUT  path to write cropped image
###

pkg load image;
addpath("./src/octave/");

## Process arguements 
args = argv();

if length(args) != 3
  error("Requires two arguements.");
endif

scale = args{1};
binary_filename = args{2};
results_filename = args{3};

if !isnumeric(scale)
  error("Scale must be numeric!");
endif

## Import images
binary_image = gron_imread(binary_filename);

## Centroid analysis
area = gron_area(binary_image);
csvwrite(results_filename, area);

## <--- more analysis methods to be added here

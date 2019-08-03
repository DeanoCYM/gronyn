#!/bin/octave -qf

### Author: Ellis Rhys Thomas
### Script: gron_analyse_equivalent.m
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
### Description: Area equivalent diameter of particles in a monocrome
### bitmap image.
###
### Usage: ./gron_analyse_equivalent INPUT OUTPUT
###
### INPUT   path to binary bitmap
### OUTPUT  path to write csv of particle diameters 
###

pkg load image;
addpath("./src/octave/");

## Process arguements 
filenames = argv();

if length(filenames) != 2
  printf("ERROR: requires two arguements.");
endif

binary_filename = filenames{1};
results_filename = filenames{2};

## Import images
binary_image = gron_imread(binary_filename);

## Centroid analysis
equivalent = gron_equivalent(binary_image);
csvwrite(results_filename, equivalent);

## <--- more analysis methods to be added here

#!/bin/octave -qf

### Author: Ellis Rhys Thomas
### Script: gron_regionprops.m
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
### Description: Binary image analysis
###
### Usage: ./gron_regionprops SCALE_IN BINARY_IN EDGES_OUT PROPS_OUT
###
### SCALE_IN     pixels per micron
### BINARY_IN    path to read monochrome bitmap (particles in white)
### EDGES_OUT    path to write monochrome bitmap of edges
### PROPS_OUT    path to write csv of region properties 
###

pkg load image;
addpath("./src/octave/");

## Process arguements 
args = argv();

scale_in  = str2num(args{1});
binary_in = args{2};
edges_out = args{3};
props_out = args{4};

if !(scale_in)
  error("Scale must be numeric!");
endif

## Import image (particles must be white!)
binary = imread(binary_in) >= 1;

## Determine parimeters and write to bitmap as 8bit so that R can read
edges = bwperim(binary);
imwrite(uint8(edges) * 255, edges_out);

## Determine region properties
prop_names = { "Area", "Centroid", "EquivDiameter" };

s = regionprops(binary, prop_names);

## Format region properites from list into table
props = horzcat(  cat(1, s.Area) / power(scale_in, 2),
		  cat(1, s.Centroid),
		  cat(1, s.EquivDiameter) / scale_in   );

## Centroids has two data columns so add extra column header
prop_names = { "Area", "CentroidX", "CentroidY", "EquivDiameter" };
gron_csvwrite(props, prop_names, props_out);
	 
## Plotting histogram of sizes - only for debugging (prettier in R)
## hist(log(props(:,4))); set(gca,'xscale','log')

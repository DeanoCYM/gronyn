#!/bin/Rscript

### Author: Ellis Rhys Thomas <e.rhys.thomas@gmail.com>
### Script: gron_plot_spatstat.R
### Date: 30/07/2019
### Depends: spatstat

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
### Description: Analyse particle dispersion with spatial statistics
###  
### Usage: ./gron_plot_spatstat CENTROIDS AREAS WIDTH HEIGHT OUT
###
### CENTROIDS csv file with coordinates of each centroid (X,Y\nX,Y...)
### AREA csv file with areas of each particle (X\nX)
### WIDTH of micrograph
### HEIGHT of micrograph
### OUT path to csv file to write to
###

suppressMessages(library("spatstat"));

source("./src/r/gron_io.R")

## Process arguments
print("DEBUG");
args = commandArgs(trailingOnly=TRUE)

if (length(args) != 5) {
    print(length(args));
    stop("ERROR: Three arguments must be supplied");
}

centroid_filename  <- as.character(args[1]);
area_filename      <- as.character(args[2]);
xmax               <- as.integer(args[3]);
ymax               <- as.integer(args[4]);
out                <- as.character(args[5]);

centroid  <- gron_readcsv(centroid_filename, c("x","y"));
area <- gron_readcsv(area_filename, "x");

## Arg validation
if (dim(centroid)[1] != dim(area)[1])
    stop("ERROR: Area and centroid data files no not match dimensions");
if (dim(centroid)[2] != 2)
    stop("ERROR: Incorrect number of columns in centroid data file");
if (dim(area)[2] != 1)
    stop("ERROR: Incorrect number of columns in area data file");

## Create point pattern object
pattern <- ppp(centroid$x, centroid$y, c(0,xmax), c(0,ymax));
marks(pattern) <- area;

gron_writecsv(pattern, out);

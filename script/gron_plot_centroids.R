#!/bin/Rscript

### Author: Ellis Rhys Thomas <e.rhys.thomas@gmail.com>
### Script: gron_plot_centroids.R
### Date: 30/07/2019
### Depends: imager

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
### Description: Plot centroids onto image
###  
### Usage: ./gron_plot_centroids IMAGE CENTROIDS OUTPUT
###
### IMAGE monochrome bitmap
### CENTROIDS csv file with coordinates of each centroid (X,Y\nX,Y...)
### OUTPUT file to save new bitmap
###

suppressMessages(library("imager"));
source("./src/r/gron_io.R");
source("./src/r/gron_plot.R");

## Process arguments
args = commandArgs(trailingOnly=TRUE)

if (length(args) != 3) {
    stop("ERROR: Three arguments must be supplied");
}

bmp_filename           <- as.character(args[1]);
centroid_filename      <- as.character(args[2]);
out_filename           <- as.character(args[3]);

## Load the required files
bitmap <- gron_loadimage(bmp_filename);
centroids <- gron_readcsv(centroid_filename, c("x","y"));

xmax <- as.integer(dim(bitmap)[1]);
ymax <- as.integer(dim(bitmap)[2]);

## Plotting
gron_startplot(xmax, ymax, out_filename);

plot(centroids, type="n",
     xlab="Direction of Deposit Development")
rasterImage(bitmap,
            xleft=0, xright=dim(bitmap)[1],
            ytop=0, ybottom=dim(bitmap)[2]);
points(centroids, col="red");

gron_stopplot();

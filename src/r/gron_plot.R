#!/bin/Rscript

### Author: Ellis Rhys Thomas <e.rhys.thomas@gmail.com>
### Script: gron_plot.R
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
### Description: R plotting functions for R
###  

## Start a plot (
gron_startplot <- function(width, height, filename, marginsize = 0) {

    ## Plot environment must be size of bitmap + size of margins
    ppi <- 72;       # resolution in pixels per inch

    bmp(filename=filename,
        width = width+marginsize, height = height+marginsize,
        units="px", res = ppi);
    
    par(xaxs="i", yaxs="i", pin= c(width,height) / ppi);

}
    
gron_stopplot <- function() {
    invisible(dev.off());
}


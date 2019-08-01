#!/bin/Rscript

### Author: Ellis Rhys Thomas <e.rhys.thomas@gmail.com>
### Script: gron_import.R
### Date: 30/07/2019
### Depends:

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
### Description: Functions for importing data into R
###  

## gron_loadimage() Import gron bitmap ##
##
## Parameters:    filename   character       Path to bitmap file
##
## Returns :                 cimg (double)   Matrix of bitmap
## 
gron_loadimage <- function(filename) {
    return(load.image(filename));
}

## gron_readcsv() Import gronyn .csv files ##
##
## Parameters:    filename    character    Path to csv file
##                col_names   list         List of column names or NULL
##
## Returns:                   list         Imported csv file
## 
gron_readcsv <- function(filename, col_names=NULL) {
    return(read.csv(filename, header=FALSE, col.names=col_names));
}

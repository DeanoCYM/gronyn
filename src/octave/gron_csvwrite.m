#!/bin/octave -qf

### Author: Ellis Rhys Thomas
### Script: gron_csvwrite.m
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
### Description: Write csv file with headers
###
### Usage: gron_csvwrite(DATA, HEADERS, FILENAME)
###
### DATA      2D matrix of data to be written to FILENAME
### HEADERS   Cell with same length as DATA containing header strings
### FILENAME  Path to write csv file
###

function gron_csvwrite(data, headers, filename)
  fid = fopen(filename, "w");
  fprintf(fid, "%s\n", strjoin(headers, ","));
  dlmwrite(fid, data, "delimiter", ",", "newline", "unix");
  fclose(fid);
end


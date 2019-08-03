#!/bin/octave -qf

### Author: Ellis Rhys Thomas
### Script: gron_perim.m
### Date: 03/08/2019
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
### Description: Returns edges of binary image in matrix (1) is edge.
###
### Usage: EDGES = gron_perim(BINARY)
###
### BINARY matrix with particles having logical 1 and bg logical 0
###
### EDGES  matrix of equal size to BINARY, with logical 1 indicating
### edges of particles.

function edges = gron_perim(binary)

  if !islogical(binary)
    error("gron_perim() requires binary matrix");
  end

  edges = bwperim(binary);

end

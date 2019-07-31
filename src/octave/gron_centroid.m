#!/bin/octave -qr

### gron_centroid.m
###
### This file is part of Gronyn.
###
### Copyright (C) 2019 Ellis Rhys Thomas
###
### Gronyn is free software: you can redistribute it and/or modify it
### under the terms of the GNU General Public License as published by
### the Free Software Foundation, either version 3 of the License, or
### (at your option) any later version.
###
### Gronyn is distributed in the hope that it will be useful, but
### WITHOUT ANY WARRANTY; without even the implied warranty of
### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
### General Public License for more details.
###
### You should have received a copy of the GNU General Public License
### along with Gronyn.  If not, see <https://www.gnu.org/licenses/>.
###
### Description:
###
### Analyse particles in monochrome image and returns coordiantes of
### the centroid of each particle. Particles should be black (0) and
### the background metal matrix white (1).
###
### Dependencies:
###
### Forge package: image
###

function centroid = gron_centroid(bwimage)
  
  ## particles must be logical 1 for region props
  bwimage = !bwimage;

  ## calculate particle properties
  s = regionprops(bwimage, "Centroid");

  centroid = cat(1, s.Centroid); # convert list to matrix

end




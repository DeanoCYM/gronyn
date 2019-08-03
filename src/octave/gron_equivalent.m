#!/bin/octave -qr

### gron_equivalent.m
###
### This file is part of Gronyn.
###
### Copyright (C) 2019 Ellis Rhys Thomas
###
### Gronyn is free software: you can redistribute it and/or modify it
###under the terms of the GNU General Public License as published by
###the Free Software Foundation, either version 3 of the License, or
###(at your option) any later version.
###
### Gronyn is distributed in the hope that it will be useful, but
###WITHOUT ANY WARRANTY; without even the implied warranty of
###MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
###General Public License for more details.
###
### You should have received a copy of the GNU General Public License
###along with Gronyn.  If not, see <https://www.gnu.org/licenses/>.
###
### Description:
###
### Analyse particles in monochrome image and returns equivalent diameter of each particle. Particles should be black (0) and the
### background metal matrix white (1).
###
### Dependencies:
###
### Forge package: image
###

function equivalent = gron_equivalent(bwimage)
  
  ## particles must be logical 1 for region props.
  bwimage = !bwimage;

  ## calculate particle properties
  s = regionprops(bwimage, "EquivDiameter");

  equivalent = cat(1, s.EquivDiameter); # convert list to matrix

end




### main.R
### 
### This file is part of Gronyn.
### 
### Copyright (C) 2019 Ellis Rhys Thomas
###
### Gronyn is free software: you can redistribute it and/or modify
### it under the terms of the GNU General Public License as published by
### the Free Software Foundation, either version 3 of the License, or
### (at your option) any later version.
###
### libwsepd is distributed in the hope that it will be useful,
### but WITHOUT ANY WARRANTY; without even the implied warranty of
### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
### GNU General Public License for more details.
###
### You should have received a copy of the GNU General Public License
### along with libwsepd.  If not, see <https://www.gnu.org/licenses/>.
###
### Description:
###
### Entry point for Gronyn. MMC statistical sterological analysis
### software.

source("gronyn.R");

img_raw <- gron_read_image("./BSE6000_002.tif");
img_crop <- gron_crop_image(img_raw, 250, 1450, 0, 1020);
img_binary <-gron_make_binary(img_crop);

gron_display(img_binary)



## img_greyscale <- gron_make_greyscale(img_greyscale);
## img_binary    <- gron_make_binary(img_greyscale);
## img_vol       <- gron_get_vol(img_binary);
## img_centroids <- gron_get_centroids(img_binary);
## img_areas     <- gron_get_areas(img_binary);


## ## threshold

## ## greyscale <- img@red;                     # rgb are equal in greyscale
## ## greyscale <- greyscale[0:1020, 160:1450]; # crop

## # Rhys!!! remember y direction is first dimension like matlab so a
## # column is a vertical line of pixels

## # make binary (add method to determine threshold)
## binary <- !(greyscale > 0.674);

## # volume incorperation inferred from area fraction
## incorp <- sum(binary) / length(binary);
## print(sprintf("Volume incorporation = %.2f", incorp*100));

## # vertical and horizontal area fraction
## ## vert_count <- 100 * (colSums(binary) / dim(greyscale)[1]);
## ## hori_count <- 100 * (rowSums(binary) / dim(greyscale)[2]);
## ## vert_count <- colSums(binary);
## ## hori_count <- rowSums(binary);
## ## lines(vert_count, col="red");

## ## spatstat







## # create ppp
## #W = owin(xrange = c(0, dim(binary)[2]), yrange = c(0, dim(binary)[1])); 
## #PPP <- as.ppp(xcoord,ycoord, W);








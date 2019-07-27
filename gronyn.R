### gronyn.R
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
### MMC statistical sterological analysis software.

library("magick", "spatstat")

### Converts magick image object into matrix
gron_magick_to_raster <- function(img) {

}


### Returns magick image object from provided filename.
gron_read_image <- function(filename) {
    img = image_read(filename);
    return(img);
}

### Displays a magick image object.
gron_display <- function(img) {
    image_display(img);
}

### Crops provided magick image object (img) to the geometry provided
### and returns cropped magick image object.
gron_crop_image <- function(img, xmin, xmax, ymin, ymax) {

    ## geometry requires imagemagick format WxH+x1+y1
    geometry <- sprintf("%.0fx%.0f+%.0f+%.0f",
                        xmax - xmin, ymax - ymin, xmin, ymin);

    img <- image_crop(img, geometry);
    return(img);
}

### Determines the required threshold value and applies it the magic
### image object and returns black and whitle magic image object.
gron_make_binary <- function(img) {
    img <- image_convert(img, colorspace="gray");
    img <- image_threshold(img, type="white", threshold="67.4%", channel=NULL);
    img <- image_threshold(img, type="black", threshold="67.4%", channel=NULL);
    return(img);
}

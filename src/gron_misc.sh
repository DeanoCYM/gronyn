#!/bin/bash

### gron_utils.sh
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
### Miscellaneous bash functions.

# Echos a unique file id based on date in the format YYMMDDHHMMSS
function gron_uid() {
    date -u +%y%m%d%I%M%S
    return 0
}

# Print error message with string from $1 and exit
function gron_die() {
    echo "ERROR: $1."
    exit 1
}

# Die if file provided by $1 unreadable
function gron_test_file() {
    if [[ ! -r $1 ]] ; then
	gron_die "file $1 is not readable"
    fi
    return 0
}
    
    


       

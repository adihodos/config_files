#!/bin/sh
diffmerge -caption="Merging" -nosplash -result="$4" -ro -t1="Mine" -t2="Merged: $4" -t3="Theirs" "$2" "$1" "$3"

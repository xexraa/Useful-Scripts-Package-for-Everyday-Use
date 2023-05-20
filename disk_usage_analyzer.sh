#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Usage: $0 <path> <num>"
	echo "  <path> - The directory to analyze"
	echo "  <num>  - The number of largest files/directories to display"
	exit 1
fi

path=$1
num=$2

if [ ! -d "$path" ]
then
	echo "Error: $path is not a valid directory"
	exit 1
fi

echo "Analyzing disk usage in $path..."

du -ah "$path" | sort -rh | head -n $num

echo "Analysis complete."


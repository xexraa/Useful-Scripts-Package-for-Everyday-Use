#!/bin/bash

directory="$1"

if [[ -z "$directory" ]]
then
	echo "Error: Directory path not provided."
	exit 1
fi

create_folders() {
	for file in "$directory"/*
	do
		if [[ -f "$file" ]]
		then
			extension="${file##*.}"
			mkdir -p "$directory/$extension"
		fi
	done
}

move_files() {
	for file in "$directory"/*
	do
		if [[ -f "$file" ]]
		then
			extension="${file##*.}"
			if [[ "$file" != "$directory/$extension"/* ]]
			then
			mv "$file" "$directory/$extension"
			fi
		fi
	done
}

organize_files() {
    create_folders
    move_files
    echo "The files have been sorted successfully."
}

organize_files


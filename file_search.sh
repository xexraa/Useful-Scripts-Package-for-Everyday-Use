#!/bin/bash

search_files() {
    local dir="$1"
    local pattern="$2"
    local search_type="$3"

    for file in "$dir"/*
    do
	if [[ -d "$file" ]]
	then
		search_files "$file" "$pattern" "$search_type"
		
	elif [[ -f "$file" ]]
	then
		if [[ "$search_type" == "name" && "$(basename "$file")" == "$pattern" ]]
		then
			echo "File exists and it is located in:"
			echo "$file"
		elif [[ "$search_type" == "extension" && "$(basename "$file")" == *".$pattern" ]]
		then
			echo "File exists and it is located in:"
			echo "$file"
		fi
        fi
    done
}

if [[ $# -lt 2 ]]
then
	echo "Usage: $0 <directory_path> <search_pattern> [name/extension]"
	exit 1
fi

directory="$1"


if [[ ! -d "$directory" ]]
then
	echo "Directory '$directory' does not exist."
	exit 1
fi

pattern="$2"

search_type="${3:-name}"

if [[ "$search_type" != "name" && "$search_type" != "extension" ]]
then
	echo "Invalid search type."
	exit 1
fi

output=$(search_files "$directory" "$pattern" "$search_type")

if [[ ${#output} -eq 0 ]]
then
	echo "No files found matching the search criteria."
else
	echo "$output"
fi


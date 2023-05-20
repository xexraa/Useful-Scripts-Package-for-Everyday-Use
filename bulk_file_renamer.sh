#!/bin/bash

if [ $# -lt 3 ]
then
	echo "Usage: $0 <directory> <search_pattern> <replace_pattern>"
	exit 1
fi

directory=$1
search_pattern=$2
replace_pattern=$3

if [ ! -d "$directory" ]
then
	echo "Directory '$directory' does not exist."
	exit 1
fi

cd "$directory" || exit 1

for file in *
do
	if [[ "$file" == *"$search_pattern"* ]]
	then
		new_name=${file/$search_pattern/$replace_pattern}
		mv "$file" "$new_name"
		echo "Renamed '$file' to '$new_name'"
	fi
done

echo "File renaming completed."


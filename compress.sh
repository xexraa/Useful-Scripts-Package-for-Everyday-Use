#!/bin/bash

if [ $# -lt 2 ]
then
	echo "Usage: $0 <archive_format> <source_file_or_directory> [<source_file_or_directory>...]"
	exit 1
fi

archive_format=$1
shift

for file_or_dir in "$@"
do
	if [ ! -e "$file_or_dir" ]
	then
		echo "Error: $file_or_dir does not exist."
		continue
	fi

	filename=$(basename "$file_or_dir")
	output_file="${filename%.*}.$archive_format"

	case $archive_format in
	zip)
	zip -r "$output_file" "$file_or_dir"
	;;
	tar.gz)
	tar -czf "$output_file" "$file_or_dir"
	;;
	*)
	echo "Error: Unsupported archive format: $archive_format"
	exit 1
	;;
	esac

	echo "Successfully compressed $file_or_dir into $output_file"
done


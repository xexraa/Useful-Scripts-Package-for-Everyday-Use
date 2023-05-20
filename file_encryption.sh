#!/bin/bash

if [[ $# -ne 2 ]]
then
	echo "Usage: $0 <file_to_encrypt> <encrypted_file>"
	exit 1
fi

file_to_encrypt=$1
encrypted_file=$2

read -s -p "Enter the encryption password: " password
echo

openssl enc -aes-256-cbc -salt -pbkdf2 -iter 10000 -in "$file_to_encrypt" -out "$encrypted_file" -k "$password"

echo "File encrypted successfully!"


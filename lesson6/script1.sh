#!/bin/bash
usage(){
  cat << EOF 
This is a script which helps to remove empty rows in files and makes letter to upper case
Usage: $0 [file(s)]

Examples:
  $0 --help - print this help
  $0 file.txt - remove empty rows and make lower case letters to upper case in choosed file
EOF
}


if [[ $1 == --help ]] ; then
   usage
elif [[ $1 == '' ]] ; then
	echo 'enter file name'
else
    sed -i '/^$/d' $1
    sed -i 's/.*/\U&/' $1
fi


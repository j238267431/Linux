#!/bin/bash
#set -e

#grep asdfghjkl /etc/passwd
usage(){
  cat << EOF
This is a file creating script in one directory
Usage: $0 [file(s)] -d [directory]
Options:
 -d - if you want to create your files in a derictory you need
Examples:
  $0 --help - print this help
  $0 -d /tmp/task_3
  $0 file1 file2 -d dire file3
  $0 -d file1 file2 file3
  $0 -d /tmp/task_3 file1 file2.sh file3
EOF
}

while [ $# -gt 0 ] ; do
	if [[ $1 == -d ]] ; then
	 DIRS+=("$2")
	 shift 2
	 continue
 else 
	FILES+=("$1")
        shift
        continue
fi


done
(( ${#DIRS[@]} > 1 )) && echo "Error. You noticed more than 1 folder. Files did not created. Please read --help" && exit 1
mkdir -p ${DIRS[0]}
for file in ${FILES[@]} ; do
	if [ -f ${DIRS[0]}/$file ] ; then
		echo "file $file  exists"
	fi	
echo $file | grep -E -a '*\.sh$' >> /dev/null
 if [[ $? == 0 ]] ; then
	touch ${DIRS[0]}/$file
	chmod +x $file ${DIRS[0]}
 else
	touch ${DIRS[0]}/$file
 fi

done

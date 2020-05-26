#!/bin/bash

LOG=/var/log/auth.log

usage(){
  cat << EOF
This is a script which monitor whether authentication succes or not. Script controlls 3 types ssh-connection, connection using GUI or terminal. Script print a message into /var/log/auth.log
usage: $0

Examples:
  $0 --help - print this help
  $0 - starting monitor
EOF
}


if [[ $1 == --help ]] ; then
   usage

   else

 tail -0f "${LOG}" | while read i 
 do
 echo $i | grep -E -a '\(gdm-[a-z]+:auth\): authentication failure' 
	if [[ $? == 0 ]] ; then
 echo "GUI auth. error" | sudo tee -a /var/log/auth.log
 fi
 echo $i | grep -E -a '\(login:auth\): authentication failure'
        if [[ $? == 0 ]] ; then
 echo "Terminal auth. error" | sudo tee -a /var/log/auth.log
 fi
 echo $i | grep -E -a '\(sshd:auth\): authentication failure'
        if [[ $? == 0 ]] ; then
 echo "SSH auth. error" | sudo tee -a /var/log/auth.log
 fi

 done
fi

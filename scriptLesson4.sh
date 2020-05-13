#!/bin/bash

grep 'web' /etc/group
if [[ $? == 0  ]] ; then
echo 'success'
else
	sudo groupadd web
fi	
grep 'geekbrains' /etc/group
if [[ $? == 0  ]] ; then
	echo 'success'
else
        sudo gruopadd geekbrains
fi
grep 'rockstar' /etc/passwd >> /dev/null
if [[ $? == 0 ]] ; then
	grep rockstar /etc/passwd | grep '143' >> /dev/null
	if [[ $? == 0 ]] ; then
		id rockstar | grep 'gid=2005' >> /dev/null
		if [[ $? == 0 ]] ; then
			id rockstar | grep 'geekbrains' >> /dev/null	
			if [[ $? == 0 ]] ; then
				id rockstar
			fi
		fi
	fi
else
	sudo useradd -u 143 rockstar -g web -G geekbrains -d /home/rockstar -m -s /bin/bash
	id rockstar
fi

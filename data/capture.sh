#!/bin/bash
if [ $# -eq 0 ] ; then
	echo "Usage: $0 filename"
else
	sudo tcpdump -i en0 -w $1
	sudo chmod a+rw $1
fi

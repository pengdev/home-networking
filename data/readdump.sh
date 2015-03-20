#!/bin/bash
RECEIVER_IP="192.168.0.102"
SENDER_IP="192.168.0.103"
if [ $# -eq 0 ] ; then
	echo "Usage: $0 filename"
else
	tcpdump -qns 0 -X -r $1 host $RECEIVER_IP and $SENDER_IP
fi

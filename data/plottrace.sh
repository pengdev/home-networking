#!/bin/bash
RECEIVER_IP="192.168.1.61"
SENDER_IP="192.168.1.185"
if [ $# -eq 0 ] ; then
	echo "Usage: $0 filename"
else
	tools/clear.sh $1
	mkdir -p build
	mkdir -p build/tmp
	mkdir -p build/tmp/$1
	mkdir -p build/output
	mkdir -p build/output/$1
	cd build/tmp/$1
	tcptrace -xtraffic" -G" -zx ../../../$1 host $RECEIVER_IP and $SENDER_IP
	for f in *.xpl
	do
		echo "processing $f"
		../../../tools/xpl2gpl $f
	done
	for f in *.gpl
        do
                echo "plotting $f"
                gnuplot $f
        done
	for f in *.ps
        do
                echo "generating pdf for $f"
                ps2pdf $f
        done
	for f in *.pdf
        do
                echo "copying $f to build/output/$1"
                cp $f ../../output/$1/$f
        done
	echo "Finished processing, exit .."
	sleep 1
fi

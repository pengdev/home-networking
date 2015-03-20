#!/bin/bash
if [ $# -eq 0 ] ; then
	echo "Usage: $0 filename"
else
	echo "cleaning previous build for $1"
	rm -r build/tmp/$1
	rm -r build/output/$1
	echo "cleared previous build for $1"
fi
#rm *.xpl
#rm *.ps
#rm *.dataset
#rm *.labels
#rm *.pdf
#rm *.dat
#rm *.gpl

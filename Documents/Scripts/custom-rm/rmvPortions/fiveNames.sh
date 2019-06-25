#!/bin/bash
#Part 1:  User should be able to give five different file names in your script to remove as arguments

for i in $1 $2 $3 $4 $5 #The loop stops when there is no more arguments or if it exceeds 5 arguments
do
	if [ -f $i ]; then #True if $i is a file
	echo "$i is a filename in this directory"

	else
	echo "$i is NOT a file!!"
	fi
done

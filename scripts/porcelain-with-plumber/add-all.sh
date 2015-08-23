#!/bin/bash -x

CHANGES=`git status --porcelain | sed 's/^ *//' | cut -d' ' -f2`

for FILE in $CHANGES; do
	git hash-object -w $FILE
	git update-index --add $FILE
done

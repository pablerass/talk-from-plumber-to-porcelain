#!/bin/bash

COMMITS=`git rev-list HEAD`

for COMMIT in $COMMITS; do
	echo "commit $COMMIT"
	git cat-file -p $COMMIT | grep -v tree
	echo
done

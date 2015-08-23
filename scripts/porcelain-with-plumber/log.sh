#!/bin/bash

COMMITS=`git rev-list HEAD`

for COMMIT in $COMMITS; do
	git cat-file -p $COMMIT | grep -v tree
	echo
done

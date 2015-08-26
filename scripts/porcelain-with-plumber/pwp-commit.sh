#!/bin/bash -x

TEXT=$1

TREE=`git write-tree`

if git show-ref HEAD; then
	COMMIT=`echo $1 | git commit-tree -p HEAD $TREE`
else
	# First commit
	COMMIT=`echo $1 | git commit-tree $TREE`
fi

git update-ref HEAD $COMMIT

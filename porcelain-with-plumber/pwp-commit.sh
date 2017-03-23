#!/bin/bash -x

TEXT=$1

TREE=`git write-tree`

HEAD_REF=`git symbolic-ref HEAD`

if git rev-parse $HEAD_REF; then
	COMMIT=`echo $1 | git commit-tree -p HEAD $TREE`
else
	# First commit
	COMMIT=`echo $1 | git commit-tree $TREE`
fi

git update-ref HEAD $COMMIT

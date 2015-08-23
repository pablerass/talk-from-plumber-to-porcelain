#!/bin/bash -x

TEXT=$1

TREE=`git write-tree`

COMMIT=`echo $1 | git commit-tree -p HEAD $TREE`

git update-ref HEAD $COMMIT

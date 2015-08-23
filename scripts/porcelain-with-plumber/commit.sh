#!/bin/bash -x

TREE=`git write-tree`

COMMIT=`git create-commit -p HEAD $TREE`

git update-ref HEAD $COMMIT

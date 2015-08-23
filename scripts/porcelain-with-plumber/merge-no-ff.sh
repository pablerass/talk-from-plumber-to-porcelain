#!/bin/bash -x

BRANCH=$1

git read-tree -m -u $M refs/heads/$BRANCH

COMMIT=`git create-commit -p HEAD -p refs/heads/$BRANCH`

git update-ref HEAD $COMMIT

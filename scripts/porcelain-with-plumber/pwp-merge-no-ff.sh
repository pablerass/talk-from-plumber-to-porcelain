#!/bin/bash -x

BRANCH=$1

BRANCH_COMMIT=`git rev-parse $BRANCH`
if git rev-list HEAD | grep $BRANCH_COMMIT; then
	echo "Already merged"
	exit 0
fi

if !git read-tree -m -u $M refs/heads/$BRANCH; then
	exit 1
fi

COMMIT=`echo "Merge commit $BRANCH" | git create-commit -p HEAD -p refs/heads/$BRANCH`

git update-ref HEAD $COMMIT

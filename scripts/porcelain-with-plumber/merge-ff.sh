#!/bin/bash -x

BRANCH=$1

BRANCH_COMMIT=`git rev-parse $BRANCH`
if git rev-list HEAD | grep $BRANCH_COMMIT; then
	echo "Already merged"
	exit 0
fi

if ! git rev-list $BRANCH | grep $HEAD; then
	echo "No fast-forward"
	exit 1
fi

if !git read-tree -u -m $M $BRANCH; then
	exit 1
fi

git update-ref HEAD refs/heads/$BRANCH

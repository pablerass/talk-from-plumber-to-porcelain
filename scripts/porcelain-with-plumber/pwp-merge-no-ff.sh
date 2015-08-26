#!/bin/bash -x

BRANCH=$1

BRANCH_COMMIT=`git rev-parse $BRANCH`
# TODO: Correct merge, is not properly done
if git read-tree -m -u $M refs/heads/$BRANCH; then
	TREE=`git write-tree`
	COMMIT=`echo "Merge commit $BRANCH" | git commit-tree -p HEAD -p $BRANCH_COMMIT $TREE`

	git update-ref HEAD $COMMIT
fi


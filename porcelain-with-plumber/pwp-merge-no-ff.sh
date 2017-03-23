#!/bin/bash -x

BRANCH=$1

MERGE_BASE=git merge-base HEAD $BRANCH
if git read-tree -m -u $MERGE_BASE $H $BRANCH; then
	TREE=`git write-tree`
	COMMIT=`echo "Merge $BRANCH" | git commit-tree -p HEAD -p $BRANCH $TREE`

	git update-ref HEAD $COMMIT
fi


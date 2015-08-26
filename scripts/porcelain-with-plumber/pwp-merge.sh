#!/bin/bash -x

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

BRANCH=$1

# Check if merge is needed
BRANCH_COMMIT=`git rev-parse $BRANCH`
if git rev-list HEAD | grep $BRANCH_COMMIT; then
	echo "Already merged"
	exit 0
fi

HEAD=$(git rev-parse HEAD)
if git rev-list $BRANCH | grep $HEAD 2> /dev/null; then
	echo "Fast-forward"
	$CUR_DIR/pwp-merge-ff.sh $BRANCH
else
	$CUR_DIR/pwp-merge-no-ff.sh $BRANCH
fi


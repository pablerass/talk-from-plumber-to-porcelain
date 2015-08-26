#!/bin/bash -x

BRANCH=$1

HEAD=$(git rev-parse HEAD)
if ! git rev-list $BRANCH | grep $HEAD > /dev/null; then
	echo "No fast-forward"
	exit 1
fi

git update-ref HEAD refs/heads/$BRANCH

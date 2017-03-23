#!/bin/bash -x

BRANCH=$1

if git read-tree -u -m $H $BRANCH; then
	git symbolic-ref HEAD refs/heads/$BRANCH
fi

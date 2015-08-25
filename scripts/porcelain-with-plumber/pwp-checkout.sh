#!/bin/bash -x

BRANCH=$1

if git read-tree -u -m $M $BRANCH; then
	git symbolic-ref HEAD refs/heads/$BRANCH
fi

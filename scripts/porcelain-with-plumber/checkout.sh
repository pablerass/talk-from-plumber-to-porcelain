#!/bin/bash -x

BRANCH=$1

git read-tree -m -u $M $BRANCH

git symbolic-ref HEAD refs/heads/$BRANCH

#!/bin/bash -x

BRANCH=$1

git update-ref HEAD refs/heads/$BRANCH

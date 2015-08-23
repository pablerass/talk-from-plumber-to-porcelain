#!/bin/bash -x

BRANCH=$1

git update-ref refs/heads/$BRANCH HEAD

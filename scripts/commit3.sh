#!/bin/bash -x

source config.sh

cd $REPO_DIR

rm f0
echo "f3" > d1/f3
echo "f4" > d1/f4
mkdir d2

git add -A
git commit -m "commit 3"

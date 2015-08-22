#!/bin/bash -x

source config.sh

cd $REPO_DIR

echo "f0" > f0
echo "f1" > f1
echo "f2" > f2

git add -A
git commit -m "commit 1"


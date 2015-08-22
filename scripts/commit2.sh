#!/bin/bash -x

source config.sh

cd $REPO_DIR

mkdir d1
mv f2 d1

git add -A
git commit -m "commit 2"
git branch "devel"
git checkout "devel"


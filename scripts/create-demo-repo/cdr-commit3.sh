#!/bin/bash -x

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source $CUR_DIR/config.sh

cd $REPO_DIR

git branch "devel"
git checkout "devel"

rm f0.file
echo "f3" > d1/f3.file
echo "f4" > d1/f4.file
mkdir d2


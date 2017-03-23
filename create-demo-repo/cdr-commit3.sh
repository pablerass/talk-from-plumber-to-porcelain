#!/bin/bash -x

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source $CUR_DIR/config.sh

cd $REPO_DIR

git branch "devel"
git checkout "devel"

rm f0.f
echo "f3" > d1/f3.f
echo "f4" > d1/f4.f
mkdir d2


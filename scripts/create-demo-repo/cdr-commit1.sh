#!/bin/bash -x

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source $CUR_DIR/config.sh

cd $REPO_DIR

echo "f0" > f0.file
echo "f1" > f1.file
echo "f2" > f2.file


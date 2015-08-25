#!/bin/bash -x

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source $CUR_DIR/config.sh

cd $REPO_DIR

echo "f3'" > d1/f3.file
echo "f5" > d1/f5.file
echo "f6" > f6.file


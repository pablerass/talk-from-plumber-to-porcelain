#!/bin/bash -x

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source $CUR_DIR/config.sh

cd $REPO_DIR
rm -Rf .git
git init
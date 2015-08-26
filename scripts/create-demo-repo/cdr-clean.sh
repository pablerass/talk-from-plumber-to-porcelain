#!/bin/bash -x

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source $CUR_DIR/config.sh

rm -Rf $REPO_DIR/*
rm -Rf $REPO_DIR/.git
git init $REPO_DIR
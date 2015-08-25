#!/bin/bash -x

source config.sh

if ! [ -d "$DIR" ]; then
	mkdir "$DIR"
fi

git init $REPO_DIR

cd $REPO_DIR

git config user.name "Pablo Muñoz"
git config user.email "pablerass@gmail.com"
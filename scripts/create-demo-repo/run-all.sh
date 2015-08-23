#!/bin/bash

COMMANDS=commit?.sh

./clean.sh
./init-repo.sh

for CMD in $COMMANDS; do
	./$CMD
done
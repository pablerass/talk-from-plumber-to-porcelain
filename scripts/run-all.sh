#!/bin/bash

COMMANDS=commit?.sh

./init-repo.sh

for CMD in $COMMANDS; do
	./$CMD
done
#!/bin/bash -x

COMMIT=$1

if git read-tree -m $M $COMMIT; then
	git update-ref HEAD $COMMIT
fi


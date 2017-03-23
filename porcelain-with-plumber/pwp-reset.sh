#!/bin/bash -x

COMMIT=$1

if git read-tree -m $H $COMMIT; then
	git update-ref HEAD $COMMIT
fi


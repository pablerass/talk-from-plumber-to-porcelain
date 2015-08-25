#!/bin/bash

STAGE=$1

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if [ -z $STAGE ]; then
	STAGE=4
fi

$CUR_DIR/cdr-clean.sh
$CUR_DIR/cdr-init-repo.sh

for COMMIT in $(seq 1 `expr $STAGE - 1`); do
	echo "--- Step $COMMIT"
	$CUR_DIR/cdr-commit${COMMIT}.sh
	$CUR_DIR/cdr-do-commit.sh $COMMIT
done

echo "--- Step $STAGE"
$CUR_DIR/cdr-commit${STAGE}.sh
#!/bin/bash

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

source $CUR_DIR/config.sh

cd $REPO_DIR

print_head() {
	HEAD=$(git symbolic-ref HEAD)
	echo "-- HEAD --"
	git show-ref $HEAD
	echo
}

print_refs() {
	echo "-- Refs --"
	REFS=$(find .git/refs -type f | sed -r 's,^\.git/,,')

	for REF in $REFS; do
		echo "$(git show-ref $REF)"
	done
	echo
}

print_log() {
	echo "-- Log --"
	for REV in `git rev-list --all`; do
		echo "$REV - $(git show -s --format=%B $REV)"
	done
	echo
}

print_staging() {
	echo "-- Staging area --"
	git ls-files --stage
	echo
}


print_objects() {
	echo "-- Objects --"
	OBJECTS=$(find .git/objects/ -type f | egrep '[0-9a-f]{38}' |
				sed -r 's,^.*([0-9a-f][0-9a-f])/([0-9a-f]{38}),\1\2,')

	for OBJ in $OBJECTS; do
		OBJ_TYPE=$(git cat-file -t $OBJ)
		echo -n "$OBJ $OBJ_TYPE "
		case $OBJ_TYPE in
			blob)
				echo "- $(git cat-file -p $OBJ)"
				;;
			commit)
				echo "- $(git show -s --format=%B $OBJ)"
				;;
			tag)
				echo
				;;
			tree)
				echo
				;;
			*)
				echo "[error]"
				;;
		esac
	done
	echo
}

print_head
print_refs
print_log
print_staging
print_objects
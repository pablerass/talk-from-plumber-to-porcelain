
-> % git init test
Initialized empty Git repository in /home/user/test/.git/

-> % cd test

-> % ls -la .git

-> % echo "v1" > test.txt
626799f0f85326a8c1fc522db584e86cdfccd51f

-> % git hash-object test.txt
626799f0f85326a8c1fc522db584e86cdfccd51f

-> % git hash-object -w test.txt
626799f0f85326a8c1fc522db584e86cdfccd51f

-> % echo "v1" | git hash-object --stdin
626799f0f85326a8c1fc522db584e86cdfccd51f

-> % echo "v2" | git hash-object --stdin
8c1384d825dbbe41309b7dc18ee7991a9085c46e

-> % echo "v2" | git hash-object --stdin -w
8c1384d825dbbe41309b7dc18ee7991a9085c46e

-> % git cat-file -p 626799f
v1

-> % git cat-file -t 626799f
blob

-> % git cat-file blob 626799f
v1

-> % git update-index ...

-> % git write-tree ...

-> % git create-commit -p <parent_commit> <tree_object>

-> % 

-> % 

-> % git ls-files --stage

-- Tags
-> % git cat-file 85dbb0 -p | git hash-object --stdin -t tag
85dbb0f2e274b77eb7f75a081435f7dbb1aaecaa

-- Show in screen
watch ls -lR objects/*
watch find objects -type f
watch git ls-files [--cached]
watch git ls-files --stage
watch cat refs/heads/master

git gc --prune=all
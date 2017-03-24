# From plumber to porcelain

## Preparation

* Draw basic data model.
* Open Git Review.

## Introduction

* Its going to be quite more than an hour.
* Need participation, ask for everything and propose, will answer, try or guess.

### Git

1. Git basics:
    * Git ∈ { *D*CVS }

1. Git as _KV_ store:
    * Git ∈ { K,V stores }
    * Different type of objects with a value from a _sha_ function.
    * In this talk _hash_ and _id_ are the same.

1. Git internals:
    * `git init`
    * Show `.git` file contents.
    * Contains a complete _git_ repository.
    * Everything outside `.git` is the working directory.

## Objects

_*Open monitor*_

Stored in `.git/objects` as files.

* `blob`: Contain data.
    * Examples:
        * Get _hash_ from `echo`.
        * Get _hash_ from file and compare with `echo`.
        * Write an object.
        * Show object content.
        * Write object to another file name.
    * Commands:
        * `hash-object [--stdin]`
        * `hash-object -w`
        * `cat-file -p`
        * `cat-file -t`
    * Comments:
        * No name, only content.
        * Different content -> Different key -> Different objec.
        * Only stored once.

* `tree`: Gives names and permissions to blob or other tree objects.
    * Examples:
        * Add files to index.
        * Show index content.
        * Create a one level tree.
        * Show tree content.
        * Add directory with files to index moving an object.
        * Create two level tree.
    * Commands:
        * `update-index [--add [--remove]]`
        * `ls-files -s`
        * `write-tree`
        * `cat-file (-t|-p)`
        * `ls-tree`
    * Comments:
        * Can be only be created through index.
        * Tree only one level, index multiple.
        * Only privileges, _pointer_ and name. No metadata.
        * Talk about metadata in index.
        * Review, same file in both trees.
        * Talk about <id/hash> and pointers.
        * Every empty file will have the same <id/hash>

_*Draw relations between trees and blobs*_

* `commit`: Pointer to tree with content.
    * Examples:
        * Create a commit from first tree.
        * Create a commit from second tree.
        * Show revision list.
        * Repeat full process with a third commit.
        * `git cat-file -p <commit> | get hash-object -t commit --stdin`.
        * `git cat-file -p <commit> | get mktree`.
    * Commands:
        * `write-tree`
        * `commit-tree <tree> [-p <parent>]`
    * Content:
        * Author (name, e-email, time).
        * Commiter (name, e-email, time).
        * Text (header, description).
        * `tree` and [parent `commit`]*.
    * Comments:
        * First commit no parent.
        * Talk about <id> and pointers.
        * By design, changes in history changes everything. Is a different
          history.
        * Cannot exists two equal commits - time.
        * Each commit tree contains all representation of file versions.
        * Hash function = `<type><size>\0<content>`.

_*Draw relations between commits and trees*_

* `tag` - Ignored in this talk. Pointer to commit with text and author.

_*Draw relations between trees and commits*_

## Refs

Objects alone are impossible to maintain so... We have references:
* Pointers to commits.
* Stored in `.git/refs` as files.

* Examples:
    * Clean everything and repeat using HEAD and master.
    * Create branch `devel` after commit 2.
    * Apply commit 3 and show log.
* Commands:
    * `rev-parse`
    * `rev-list [--all]`
    * `update-ref [--no-deref]`
    * `symbolic-ref`
* Comments:
    * Talk about how commit is done.
    * Branches evolve with changes, tags are fixed.

_*Draw branches and tags*_

## Staging area and working directory

Staging area - Only way to interchange files between working directory and
repository.

* Examples:
    * What is HEAD.
    * Already seen:
        * Write to staging area from working directory.
        * Write trees from staging area.
    * Read tree into staging area.
    * Checkout to working directory.
    * Join read from index with refs.
        * `checkout` - Change HEAD to specified ref and read tree.
        * `reset` - Change HEAD ref to specified ref and read tree.
* Commands:
    * `update-index`
    * `write-tree`
    * `read-tree`
    * `commit-tree`
    * `diff-index`
* Comments:
    * What shows `git status`.
    * Recover previous commit content.

_*Draw HEAD and index*_

## Plumber commands

_*Show demo-explain-8 and talk about commands*_

1. Already seen:
    * `add`
    * `commit`
    * `checkout`
    * `branch`
    * `reset`

_*Show and discuss code*_

1. Pending:
    * `log`:
        * Rev list with cat-files.
    * `merge`:
        * Guess if merge is needed - merge origin branch commit already in
          rev-list.
        * Check if fast forward - current HEAD commit in merge origin branch
          rev-list.
        * Do fast forward - change HEAD to merge origin branch.
        * Explain no fast forward.
            * Flag in index when multiple copies stored.
    * `rebase`, `stash`, `cherry-pick`...

_*Think about that and try*_

## Conclusions

* We have not talk about of `pull`, `push` or `clone` from other repositories.
* All scripts and examples in [my GitHub account](
  https://github.com/pablerass/talk-from-plumber-to-porcelain).
* Impact of design in operations: checkout, _diffs_, rewriting history.

## Talk about

* Revert full working directory only to previous commit... Different index
  file?
* `symbolic-ref` previously implemented as `ln -s` and deprecated due to
  multi-platform compatibility.
* Why is a distributed CVS and what means a checkout.
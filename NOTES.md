# From plumber to porcelain

## Introduction

1. What is Git.
    * Git ∈ { *D*CVS }

1. What we see about Git.
    * Sequence of commits.
        * Commits contains: Parent, author, mail, time, text header, text.
        * Differences between commits (new, deleted, modified).
    * Branches - Pointers to commits.
    * Working directory.
        * HEAD.
    * How to create a commit.
        * Index / Staging area.
        * Add.

1. What Git really is - Using empty repository.
    * Git ∈ { K,V stores }

1. K,V plumberign management.
    * Creating an empty repository.
        * Show `.git` content file.
    * Managing _blob_ objects.
    * Creating _tree_ object.
        * Using the index file.
    * Creating _commit_ object.

1. Join plumber into porcelain.
    * Log - `rev-list`.
    * Commit.
    * Checkout.
        * Git is a Distributed CVS and `.git` is the repository.
    * Merge - fast-forward, no fast-forward.

1. Working directory, staging area and HEAD.
    * `index` file content.
    * `checkout`, `reset` and `add` in plumber.

## Talk about

* Index file content.
    * Mark of file status.
* Revert full working directory to previous commit.
* Bamboo branch failure causes master failure.
* `reflog` content.
* Difference between ref and symbolic-ref. Previously use of `ln -s` and
  deprecated due to multi-platform compatibility.
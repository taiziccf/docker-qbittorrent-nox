#!/bin/sh

git submodule foreach 'git fetch --all --prune'
git submodule foreach 'git rebase origin'

# EOF

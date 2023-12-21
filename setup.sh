#!/bin/sh

# make a symbolic link with the pre-commit hook
# NOTE: When git is evaluating the symlink, it apparently does so using .git/hooks as its working directory, so relative paths should be relative to that directory.
# $(git rev-parse --git-dir)
PRE_COMMIT=$(git rev-parse --git-dir)/hooks/pre-commit
GIT_ROOT=$(git rev-parse --show-toplevel)

rm -f $PRE_COMMIT
ln -s $GIT_ROOT/Biba/Scripts/GitHooks/pre-commit.sh $PRE_COMMIT
chmod +x $PRE_COMMIT

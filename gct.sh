#!/bin/bash

# load up branch
RAW=`git branch`

# die if git branch is not successful (repo doesn't exist)
if [ $? -gt 0 ]; then
    exit
fi

# parse branch name since we know it's a git repo
BRANCH=`git branch | grep "*" | sed s/*\ //`

# load remotes just to ensure we have a remote branch we
# want to push to. right now we default to origin however
# maybe we want to add another argument to override that
# in the future?
REMOTES=`git remote`

# commit message (1st argument passed to script)
MSG=$1

# ensure commit messages is passed
if [ ! "$MSG" ]; then
    echo No argument was passed!
    exit
fi

# add everything and commit unless $2 is true
# which means we want to preserve the integrity
# of stage and only commit staged files.
if [ ! $2 ] || [ "$2" != "true" ]; then
    git add .
fi

git commit -m "$MSG"

# deploy changes to origin remote with whatever branch name
# we are currently on
if [ "$REMOTES" ]; then
    git push origin $BRANCH
fi

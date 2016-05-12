#!/bin/bash

# Exit if any subcommand fails.
set -e

# Variables
ORIGIN_URL=`git config --get remote.origin.url`

echo "Started deploying"

# Build


# Push to gh-pages
git config user.name "$USER_NAME"
git config user.email "$USER_EMAIL"

git add -fA
# git commit --allow-empty -m "$(git log -1 --pretty=%B) [CI]"
git subtree push --prefix build $ORIGIN_URL gh-pages

git checkout -

echo "Deployed"

exit 0
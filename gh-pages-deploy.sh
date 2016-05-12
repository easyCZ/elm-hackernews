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

# http://www.damian.oquanta.info/posts/one-line-deployment-of-your-site-to-gh-pages.html
git subtree split --prefix output -b gh-pages
git push -f origin gh-pages:gh-pages
git branch -D gh-pages

echo "Deployed"

exit 0
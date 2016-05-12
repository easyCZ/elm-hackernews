#!/bin/bash

# Exit if any subcommand fails.
set -e

echo "Started deploying"

# Build
npm run build

# Push to gh-pages
git config user.name "$USER_NAME"
git config user.email "$USER_EMAIL"

# http://www.damian.oquanta.info/posts/one-line-deployment-of-your-site-to-gh-pages.html
git checkout master
git subtree split --prefix build -b gh-pages
git push -f origin gh-pages:gh-pages
git branch -D gh-pages

echo "Deployed"

exit 0
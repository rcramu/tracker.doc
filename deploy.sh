#!/usr/bin/env sh

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the index.
npm install
npm run index

# Generate Site
hugo

# Add changes to git.
git add -A

# Commit changes.
msg="Rebuild site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
git subtree push --prefix=public git@github.com:rajasoun/tracker.doc.git gh-pages

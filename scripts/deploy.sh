#!/usr/bin/env bash
set -euo pipefail

REMOTE_DEST=/home2/rilopezc/public_html
echo -e "\033[0;32mDeploying updates ...\033[0m"

# Build the project.
hugo

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

rsync --progress --delete -rave "ssh "  \
    --exclude cgi-bin  \    
    public  rilopezc@rilopez.com:$REMOTE_DEST
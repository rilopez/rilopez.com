#!/usr/bin/env bash
set -euo pipefail

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


rsync -avz --delete --progress -e 'ssh -p 2222'  public/ rilopezc@rilopez.com:~/public_html

curl "http://www.google.com/ping?sitemap=http://rilopez.com/sitemap.xml"

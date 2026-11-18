#!/usr/bin/env bash

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "Not a Git repository"
    exit 1
}

echo "Repository : $(basename "$(git rev-parse --show-toplevel)")"
echo "Branch     : $(git branch --show-current)"
echo "Remote     : $(git remote get-url origin 2>/dev/null)"
echo "Last Commit: $(git log --oneline -1)"
echo "Status     :"
git status --short
echo
echo "---- Staged Changes ----"

if git diff --staged --quiet; then
  echo "No changes in the staging index "
else
  git diff --staged --quiet
fi
done
echo "---- Commit History ----"
git log --oneline --graph --decorate --all -10
echo "---- Remote Branches ----"
git branch -r 

#!/usr/bin/env bash

git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "Not a Git repository"
    exit 1
}

echo "Repository : $(gh repo view --json name --jq .name)"
echo "Branch     : $(git branch --show-current)"
echo "Remote     : $(git remote get-url origin 2>/dev/null)"
echo "Last Commit: $(git log --oneline -3)"
git log -1 --pretty=format:"%h%nAuthor: %an <%ae>%nDate: %ad%n" --date=iso
echo "Status     :"
git status --short
echo
echo "---- Staged Changes ----"

if git diff --staged --quiet; then
  echo "No changes in the staging index "
else
  git diff --staged --quiet
fi
echo "---- Commit History ----"
git log --oneline --graph --decorate --all -10

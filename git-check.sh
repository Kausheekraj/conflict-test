#!/usr/bin/env bash
# Verfication
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || {
    echo "Not a Git repository"
    exit 1
}

echo "Repository : conflicts"
echo "Branch     : master"
echo "Remote     : https://github.com/Kausheekraj/conflict-test.git"
echo "Last Commit: "
echo "Status     :"
git status --short

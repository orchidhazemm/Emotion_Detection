#!/bin/bash
# Run this AFTER mounting your drive and copying the project, or use it to copy from a path.
# Usage:
#   ./mount-and-push.sh                          # just init git and prepare push (content already in this folder)
#   ./mount-and-push.sh "/path/to/source/folder" # copy from source then init git and prepare push

set -e
PROJECT_DIR="/Users/yabiair/GithubProject/NLP_Project/Egyptian Text Dataset from Facebook"
cd "$PROJECT_DIR"

if [ -n "$1" ]; then
  echo "Copying project from: $1"
  SRC="$1"
  [ -d "$SRC" ] || { echo "Error: $SRC is not a directory."; exit 1; }
  for f in "$SRC"/* "$SRC"/.[!.]* "$SRC"/..?*; do
    [ -e "$f" ] || continue
    name=$(basename "$f")
    [ "$name" = ".git" ] && continue
    cp -R "$f" "$PROJECT_DIR/"
  done
  echo "Copy done."
fi

if [ ! -d .git ]; then
  git init
  git add .
  git commit -m "Initial commit: Egyptian Text Dataset from Facebook"
  git branch -M main
  echo ""
  echo "Git initialized and first commit created."
else
  echo "Git already initialized. Adding and committing any new changes..."
  git add .
  git status
  git diff --cached --quiet || git commit -m "Update: Egyptian Text Dataset from Facebook"
fi

echo ""
echo "--- Next: add your GitHub repo and push ---"
echo "1. Create a new empty repo at https://github.com/new (no README, no .gitignore)"
echo "2. Run (replace YOUR_USERNAME and REPO_NAME):"
echo ""
echo "   git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git"
echo "   git push -u origin main"
echo ""
echo "Or with SSH:"
echo "   git remote add origin git@github.com:YOUR_USERNAME/REPO_NAME.git"
echo "   git push -u origin main"

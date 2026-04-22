#!/usr/bin/env bash
# update_website.sh — rebuild metadata/catalog and push to trigger CI deploy
#
# Usage: ./update_website.sh [--dry-run]
#   --dry-run  Build locally, show what would be committed, don't push.
#
# CI (deploy-site.yml) fires on pushes touching:
#   catalog.json, data/**/metadata.json, web/**
# It copies data/**/*.{mp3,pdf,midi,mid,ly} into web/public/assets/ at build time.

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
DRY_RUN=false

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=true ;;
    *) echo "Unknown argument: $arg"; exit 1 ;;
  esac
done

cd "$REPO_ROOT"

echo "=== Step 1: Build metadata.json for each niggun ==="
python3.13 tools/build_metadata.py

echo ""
echo "=== Step 2: Assemble catalog.json ==="
python3.13 tools/build_catalog.py

echo ""
echo "=== Step 3: Stage changes ==="
git add catalog.json tags.json
git add data/

git status --short

echo ""
if git diff --cached --quiet; then
  echo "Nothing to commit — catalog already up to date."
  exit 0
fi

COMMIT_MSG="chore: rebuild renders and catalog"

if $DRY_RUN; then
  echo "DRY RUN — would commit: $COMMIT_MSG"
  echo "DRY RUN — would push to origin/main"
  exit 0
fi

echo "=== Step 4: Commit ==="
git commit -m "$COMMIT_MSG"

echo ""
echo "=== Step 5: Push (triggers CI deploy) ==="
git push

echo ""
echo "Done. Monitor deploy at: https://github.com/andros613/niggun-saloon/actions"

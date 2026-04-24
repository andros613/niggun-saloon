#!/usr/bin/env bash
# update_website.sh — rebuild metadata/catalog and push to trigger CI deploy
#
# Usage: ./update_website.sh [--dry-run]
#   --dry-run  Build locally, show what would be committed, don't push.
#
# CI (deploy-site.yml) fires on pushes touching:
#   catalog.json, data/**/metadata.json, web/**
# Assets (mp3/pdf/midi/ly) are committed to web/public/assets/ by this script.

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
echo "=== Step 3: Copy assets to web/public/assets/ ==="
find data -type f -not -path "*/versions/*" \( -name "*.mp3" -o -name "*.pdf" -o -name "*.midi" -o -name "*.mid" -o -name "*.ly" \) \
  | while read -r src; do
      dir=$(basename "$(dirname "$src")")
      dest="web/public/assets/$dir"
      mkdir -p "$dest"
      cp "$src" "$dest/"
    done

echo ""
echo "=== Step 4: Stage changes ==="
git add catalog.json tags.json
git add data/
git add web/public/assets/

git status --short

echo ""
if git diff --cached --quiet; then
  echo "Nothing to commit — already up to date."
  exit 0
fi

COMMIT_MSG="chore: rebuild renders and catalog"

if $DRY_RUN; then
  echo "DRY RUN — would commit: $COMMIT_MSG"
  echo "DRY RUN — would push to origin/main"
  exit 0
fi

echo "=== Step 5: Commit ==="
git commit -m "$COMMIT_MSG"

echo ""
echo "=== Step 6: Push (triggers CI deploy) ==="
git push

echo ""
echo "Done. Monitor deploy at: https://github.com/andros613/niggun-saloon/actions"

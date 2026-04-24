---
title: Dayenu Choral Variation Indexing
date: 2026-04-22
---

# Dayenu Choral Variation Indexing

## New Niggunim Added

| Dir | Type | Files |
|-----|------|-------|
| `niggun-023-dayenu` | base niggun | `.ly`, `.mp3`, `.pdf`, `.midi`, `words_he.txt`, `words_en.txt` |
| `niggun-023a-dayenu-choral-01` | choral variation | `.ly`, `.mp3`, `.pdf`, `.midi` |

**LilyPond title typo** in `niggun_023a_dayenu_choral_01.ly`: `"Dayenu (Chroral) 01"` — note misspelling; will surface in rendered metadata. Fix in `.ly` before re-rendering if needed.

## How the Variation System Works

- `build_metadata.py` detects `-choral-` in dir name → sets `arrangement_type: "choral"`
- `parse_dir_name()` on `niggun-023a-dayenu-choral-01` → `id="023a"`, `variant_of="023"`
- `build_catalog.py` cross-references: injects `niggun-023a-dayenu-choral-01` into parent's `choral_arrangements[]`
- Browse page hides variation dirs; parent card shows choral badge; detail page shows Arrangements section

## Changes Made

### `tags.json`
- **Fixed**: missing comma after `niggun-022-beinoni` entry (you fixed this)
- **Added**: `"niggun-023a-dayenu-choral-01": ["chag", "pesach"]`
- `niggun-023-dayenu` already had `["chag", "pesach"]`

### `update_website.sh` (new, repo root)
Single script to rebuild and deploy:
```
./update_website.sh           # build + commit + push
./update_website.sh --dry-run # build only, show diff, no push
```

## Steps to Publish

```bash
./update_website.sh
```

This runs:
1. `python3.13 tools/build_metadata.py` — writes `data/*/metadata.json`
2. `python3.13 tools/build_catalog.py` — writes `catalog.json`
3. `git add catalog.json tags.json data/`
4. `git commit -m "chore: rebuild renders and catalog"`
5. `git push` — triggers `deploy-site.yml` in CI

CI copies `data/**/*.{mp3,pdf,midi,mid,ly}` → `web/public/assets/` at build time.

## Sort Order

`build_catalog.py::sort_key()` parses `(\d+)([a-z]?)` from `id`. For `023a` → `(23, 'a')`. Sorts correctly after `023`.

## Existing Tags.json State at Time of Changes

29 entries total (pre-change: 28, lacked `023a`). All entries valid against `tag_defs.json`.

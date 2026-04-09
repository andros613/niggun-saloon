#!/usr/bin/env python3
"""
Assemble catalog.json at the repo root from per-niggun metadata.json files.

Usage:
    python tools/build_catalog.py [--data-dir DATA_DIR] [--out OUT]

The catalog is a JSON object with:
  - "nigguns": list of all metadata records, sorted by id
  - "generated_at": ISO timestamp

Missing asset URLs are left null; a separate CI step (or build_variants.py)
will populate asset_urls once files are uploaded to GitHub Releases.
"""

import argparse
import json
import logging
import time
from datetime import datetime, timezone
from pathlib import Path

logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
logger = logging.getLogger(__name__)


def sort_key(record: dict) -> tuple:
    """Sort by numeric part of id, then suffix, then full id string."""
    import re
    m = re.match(r'^(\d+)([a-z]?)$', record["id"])
    if m:
        return (int(m.group(1)), m.group(2))
    # Non-numeric ids sort after all numbered ones
    return (9999, record["id"])


def parse_args():
    p = argparse.ArgumentParser(description="Assemble catalog.json from metadata.json files.")
    p.add_argument("--data-dir", default="data", help="Path to the data/ directory")
    p.add_argument("--out", default="catalog.json", help="Output catalog file path")
    return p.parse_args()


def main():
    start = time.time()
    args = parse_args()

    data_dir = Path(args.data_dir)
    if not data_dir.is_dir():
        raise ValueError(f"Data directory not found: {data_dir}")

    records = []
    missing = []

    for dir_path in sorted(data_dir.iterdir()):
        if not dir_path.is_dir():
            continue
        meta_path = dir_path / "metadata.json"
        if not meta_path.exists():
            missing.append(dir_path.name)
            continue
        record = json.loads(meta_path.read_text(encoding="utf-8"))
        records.append(record)

    records.sort(key=sort_key)

    # Cross-reference: inject piano_arrangements / choral_arrangements onto parent nigguns
    by_id = {r["id"]: r for r in records}
    for r in records:
        r.setdefault("piano_arrangements", [])
        r.setdefault("choral_arrangements", [])

    for r in records:
        arr_type = r.get("arrangement_type")
        if arr_type in ("piano", "choral") and r.get("variant_of"):
            parent_id = r["variant_of"]
            if parent_id in by_id:
                by_id[parent_id][f"{arr_type}_arrangements"].append(r["dir"])
            else:
                logger.warning(f"{r['dir']}: variant_of={parent_id!r} not found in catalog")

    catalog = {
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "count": len(records),
        "nigguns": records,
    }

    out_path = Path(args.out)
    out_path.write_text(json.dumps(catalog, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")

    elapsed = time.time() - start
    mins, secs = divmod(elapsed, 60)

    logger.info(f"Wrote {len(records)} records to {out_path}")
    if missing:
        logger.info(f"Skipped {len(missing)} dirs without metadata.json: {', '.join(missing)}")
    logger.info(f"Done in {int(mins)}m {secs:.1f}s")


if __name__ == "__main__":
    main()

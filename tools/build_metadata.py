#!/usr/bin/env python3
"""
Generate metadata.json for each niggun directory in data/.

Usage:
    python tools/build_metadata.py [--data-dir DATA_DIR] [--dry-run]

Parses LilyPond headers, key/tempo directives, README files, and
detects which asset files exist. Writes metadata.json into each directory.
Skips directories with no .ly file (stubs).
"""

import argparse
import json
import logging
import re
import time
from pathlib import Path

logging.basicConfig(level=logging.INFO, format="%(levelname)s: %(message)s")
logger = logging.getLogger(__name__)

# Base path for rendered assets within the web/public/ directory.
# Files are committed to web/public/assets/<dir>/ by build-renders.yml.
# The Astro site prepends the base URL at runtime, so this is a site-relative path.
ASSETS_BASE = "assets"


# ---------------------------------------------------------------------------
# LilyPond parsing
# ---------------------------------------------------------------------------

def parse_ly_header(text: str) -> dict:
    """Extract fields from the \\header { ... } block."""
    m = re.search(r'\\header\s*\{([^}]*)\}', text, re.DOTALL)
    if not m:
        return {}
    # Strip LilyPond comment lines before parsing
    block = '\n'.join(line for line in m.group(1).splitlines() if not line.strip().startswith('%'))
    fields = {}
    for key in ("title", "subtitle", "arranger", "copyright", "composer", "instrument"):
        km = re.search(rf'{key}\s*=\s*"([^"]*)"', block)
        if km:
            fields[key] = km.group(1).strip()
    return fields


def parse_key(text: str) -> str | None:
    """Extract the first \\key tonic \\mode directive."""
    m = re.search(r'\\key\s+([a-g](?:is|es)?)\s+\\(major|minor|dorian|phrygian|lydian|mixolydian|locrian)', text)
    if not m:
        return None
    tonic_map = {
        "c": "C", "cis": "C#", "ces": "Cb",
        "d": "D", "dis": "D#", "des": "Db",
        "e": "E", "eis": "E#", "ees": "Eb",
        "f": "F", "fis": "F#", "fes": "Fb",
        "g": "G", "gis": "G#", "ges": "Gb",
        "a": "A", "ais": "A#", "aes": "Ab",
        "b": "B", "bis": "B#", "bes": "Bb",
    }
    tonic = tonic_map.get(m.group(1), m.group(1).capitalize())
    mode = m.group(2)
    return f"{tonic} {mode}"


def parse_tempo(text: str) -> int | None:
    """Extract the first \\tempo N = BPM directive.

    Prefers inline tempo (e.g. inside a music block) over variable assignments
    (myTempo = \\tempo 4 = 120), but falls back to the latter if nothing else found.
    """
    inline_bpm = None
    variable_bpm = None

    for m in re.finditer(r'\\tempo\s+\d+\.?\s*=\s*(\d+)', text):
        start = m.start()
        line_start = text.rfind('\n', 0, start) + 1
        prefix = text[line_start:start].strip()
        bpm = int(m.group(1))
        if prefix.endswith('='):
            # Variable assignment: myTempo = \tempo 4 = 120
            if variable_bpm is None:
                variable_bpm = bpm
        else:
            if inline_bpm is None:
                inline_bpm = bpm

    return inline_bpm if inline_bpm is not None else variable_bpm


_GREG_MONTHS = (
    "January|February|March|April|May|June|"
    "July|August|September|October|November|December"
)
_HEB_MONTHS = (
    "Marcheshvan|Menachem\\s+Av|"   # multi-word variants first
    "Nissan|Nisan|Iyar|Sivan|Tammuz|Av|Elul|"
    "Tishrei|Cheshvan|Kislev|Teves|Tevet|Shevat|Adar"
)


def parse_arranger_field(raw: str) -> dict:
    """Parse pipe-delimited arranger line into name, dates, and version.

    Format: "Arranged by Name | Hebrew Month Year / Gregorian Month Year | vNN | B''H"
    All segments after the name are optional and order-independent.
    """
    segments = [s.strip() for s in raw.split("|")]

    name = re.sub(r'^Arranged\s+by\s+', '', segments[0], flags=re.IGNORECASE).strip()

    date_gregorian = None
    date_hebrew = None
    version = None

    for seg in segments[1:]:
        # Version token: exactly vNN
        if re.fullmatch(r'v\d+', seg):
            version = seg
            continue
        # Skip B''H / BS''D blessing tokens
        if re.search(r"B['S]+''[DHH]", seg):
            continue
        # Extract Hebrew month + year
        hm = re.search(rf'({_HEB_MONTHS})\s+(\d{{4}})', seg)
        if hm:
            date_hebrew = f"{hm.group(1)} {hm.group(2)}"
        # Extract Gregorian month + year
        gm = re.search(rf'({_GREG_MONTHS})\s+(\d{{4}})', seg)
        if gm:
            date_gregorian = f"{gm.group(1)} {gm.group(2)}"

    return {
        "arranger": name,
        "date_gregorian": date_gregorian,
        "date_hebrew": date_hebrew,
        "version": version,
    }


# ---------------------------------------------------------------------------
# Reference / URL extraction
# ---------------------------------------------------------------------------

def classify_url(url: str) -> dict:
    """Return type + embed info for a URL."""
    # YouTube
    yt = re.search(r'(?:youtube\.com/watch\?v=|youtu\.be/)([A-Za-z0-9_-]{11})', url)
    if yt:
        return {"type": "youtube", "embed_id": yt.group(1)}
    # Chabad multimedia (audio/video pages)
    if re.search(r'chabad\.org/multimedia/', url):
        return {"type": "chabad_media"}
    # Everything else
    return {"type": "link"}


def extract_references(ly_text: str) -> list[dict]:
    """Extract URLs from non-commented \\line blocks, with their labels."""
    refs = []
    seen = set()

    for line in ly_text.splitlines():
        stripped = line.strip()
        # Skip pure comment lines
        if stripped.startswith('%'):
            continue
        # Find URLs
        url_m = re.search(r'https?://\S+', stripped)
        if not url_m:
            continue
        url = url_m.group(0).rstrip('}"')   # strip trailing punctuation
        if url in seen:
            continue
        seen.add(url)

        # Extract label: everything before the URL, stripped of LilyPond markup
        before = stripped[:url_m.start()]
        # Remove LilyPond tokens: \line, \small, \tiny, \large, \markup, braces, quotes
        label = re.sub(r'\\(?:line|small|tiny|large|markup|bold|italic)\b', '', before)
        label = re.sub(r'[{}"\\]', '', label).strip().rstrip(':').strip()

        info = classify_url(url)
        refs.append({"url": url, "label": label or None, **info})

    return refs


# ---------------------------------------------------------------------------
# Directory / variant parsing
# ---------------------------------------------------------------------------

def parse_dir_name(dir_name: str) -> dict:
    """
    Parse a directory name into id, slug, and variant info.

    Examples:
      niggun-001-r-eade                    → id=001,  slug=r-eade, variant_of=None
      niggun-002a-shalom-aleichem-fast     → id=002a, slug=shalom-aleichem-fast, variant_of=002
      niggun-004b-acheinu-piano-02         → id=004b, slug=acheinu-piano-02, variant_of=004
      some-non-standard-dir                → id=some-non-standard-dir, slug=None, variant_of=None
    """
    m = re.match(r'^niggun-(\d+)([a-z]?)-(.+)$', dir_name)
    if m:
        num = m.group(1)
        suffix = m.group(2)
        slug = m.group(3)
        nid = f"{num}{suffix}"
        variant_of = num if suffix else None
        return {"id": nid, "slug": slug, "variant_of": variant_of}
    # Non-standard dir (doesn't match niggun-NNN[suffix]-slug pattern)
    return {"id": dir_name, "slug": None, "variant_of": None}


def detect_assets(dir_path: Path) -> dict:
    files = {f.name for f in dir_path.iterdir() if f.is_file()}
    return {
        "has_ly":           any(f.endswith('.ly')          for f in files),
        "has_pdf":          any(f.endswith('.pdf')         for f in files),
        "has_mp3":          any(f.endswith('.mp3')         for f in files),
        "has_midi":         any(f.endswith(('.midi','.mid')) for f in files),
        "has_words_he":     "words_he.txt"     in files,
        "has_words_en":     "words_en.txt"     in files,
        "has_words_th_en":  "words_th_en.txt"  in files,
        "has_words_as_ashk":"words_as_ashk.txt" in files,
        "has_versions_dir": (dir_path / "versions").is_dir(),
    }


def build_asset_urls(dir_path: Path, stem: str) -> dict:
    """Return site-relative asset paths for each rendered asset that exists locally.
    The Astro site prepends BASE_URL at runtime: `${base}${asset_url}`.
    """
    dir_name = dir_path.name

    def rel(ext: str) -> str | None:
        candidates = [f"{stem}.{ext}"]
        if ext == "midi":
            candidates.append(f"{stem}.mid")
        for name in candidates:
            if (dir_path / name).exists():
                return f"{ASSETS_BASE}/{dir_name}/{name}"
        return None

    return {
        "mp3":  rel("mp3"),
        "pdf":  rel("pdf"),
        "midi": rel("midi"),
        "ly":   rel("ly"),
    }


# ---------------------------------------------------------------------------
# Main logic
# ---------------------------------------------------------------------------

def build_metadata(dir_path: Path) -> dict | None:
    """Build metadata dict for one niggun directory. Returns None if no .ly found."""
    ly_files = list(dir_path.glob("*.ly"))
    if not ly_files:
        return None

    # Use the first .ly file found (usually exactly one)
    ly_path = ly_files[0]
    ly_text = ly_path.read_text(encoding="utf-8")

    header = parse_ly_header(ly_text)
    raw_title = header.get("title", "")
    # Strip leading "Niggun NNN - " prefix from title
    title = re.sub(r'^Niggun\s+\d+\w*\s*[-–]\s*', '', raw_title).strip()
    if not title:
        title = raw_title

    subtitle = header.get("subtitle", "")

    arranger_info = parse_arranger_field(header.get("arranger", ""))
    arranger = arranger_info["arranger"] or "Amichai Andy Rosenbaum"
    date_gregorian = arranger_info["date_gregorian"]
    date_hebrew = arranger_info["date_hebrew"]
    version = arranger_info["version"]
    license_str = header.get("copyright") or None

    key = parse_key(ly_text)
    tempo_bpm = parse_tempo(ly_text)
    references = extract_references(ly_text)

    # README description
    readme_path = dir_path / "README.md"
    description = ""
    if readme_path.exists():
        readme_text = readme_path.read_text(encoding="utf-8").strip()
        # Strip the H1 title line
        lines = [l for l in readme_text.splitlines() if not l.startswith("# ")]
        description = "\n".join(lines).strip()

    dir_info = parse_dir_name(dir_path.name)
    assets = detect_assets(dir_path)
    stem = ly_path.stem
    asset_urls = build_asset_urls(dir_path, stem)

    dir_name = dir_path.name
    if '-piano-' in dir_name:
        arrangement_type = 'piano'
    elif '-choral-' in dir_name:
        arrangement_type = 'choral'
    else:
        arrangement_type = None

    return {
        "id": dir_info["id"],
        "dir": dir_path.name,
        "title": title,
        "subtitle": subtitle,
        "arranger": arranger,
        "date_gregorian": date_gregorian,
        "date_hebrew": date_hebrew,
        "version": version,
        "license": license_str,
        "key": key,
        "tempo_bpm": tempo_bpm,
        "description": description,
        "variant_of": dir_info["variant_of"],
        "arrangement_type": arrangement_type,
        "assets": assets,
        "asset_urls": asset_urls,
        "references": references,
        "tags": [],
    }


def _load_valid_tags(repo_root: Path) -> set[str]:
    """Load valid tag slugs from tag_defs.json at the repo root."""
    tag_defs_path = repo_root / "tag_defs.json"
    if not tag_defs_path.exists():
        raise ValueError(f"tag_defs.json not found at {tag_defs_path}")
    defs = json.loads(tag_defs_path.read_text(encoding="utf-8"))
    return {entry["slug"] for entry in defs}


def load_tags(repo_root: Path) -> dict[str, list[str]]:
    """Load tags.json from the repo root. Returns {} if not found."""
    valid_tags = _load_valid_tags(repo_root)
    tags_path = repo_root / "tags.json"
    if not tags_path.exists():
        return {}
    raw = json.loads(tags_path.read_text(encoding="utf-8"))
    # Validate and normalise
    result = {}
    for dir_name, tags in raw.items():
        invalid = [t for t in tags if t not in valid_tags]
        if invalid:
            logger.warning(f"{dir_name}: unknown tags {invalid} — skipping them")
        result[dir_name] = [t for t in tags if t in valid_tags]
    return result


def parse_args():
    p = argparse.ArgumentParser(description="Generate metadata.json for each niggun directory.")
    p.add_argument("--data-dir", default="data", help="Path to the data/ directory")
    p.add_argument("--dry-run", action="store_true", help="Print metadata but don't write files")
    return p.parse_args()


def main():
    start = time.time()
    args = parse_args()

    data_dir = Path(args.data_dir)
    if not data_dir.is_dir():
        raise ValueError(f"Data directory not found: {data_dir}")

    repo_root = data_dir.parent
    all_tags = load_tags(repo_root)
    logger.info(f"Loaded tags for {len(all_tags)} dirs from tags.json")

    dirs = sorted(p for p in data_dir.iterdir() if p.is_dir())
    processed = skipped = 0

    for dir_path in dirs:
        metadata = build_metadata(dir_path)
        if metadata is None:
            logger.info(f"SKIP {dir_path.name} (no .ly file)")
            skipped += 1
            continue

        # Merge hand-curated tags from tags.json
        metadata["tags"] = all_tags.get(dir_path.name, [])

        out_path = dir_path / "metadata.json"
        json_str = json.dumps(metadata, indent=2, ensure_ascii=False)

        if args.dry_run:
            print(f"\n=== {dir_path.name}/metadata.json ===")
            print(json_str)
        else:
            out_path.write_text(json_str + "\n", encoding="utf-8")
            logger.info(f"WROTE {out_path.relative_to(data_dir.parent)}")

        processed += 1

    elapsed = time.time() - start
    mins, secs = divmod(elapsed, 60)
    logger.info(f"Done: {processed} written, {skipped} skipped in {int(mins)}m {secs:.1f}s")


if __name__ == "__main__":
    main()

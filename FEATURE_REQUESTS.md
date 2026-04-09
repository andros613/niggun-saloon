# Feature Requests

## Audio-Synchronized Score Following

**Summary:** As audio plays, the sheet music scrolls and highlights the current measure in sync.

**Why it's non-trivial:** The browser PDF viewer has no JavaScript API — it can't be controlled programmatically. The solution requires switching from PDF to SVG rendering.

**Approach: LilyPond SVG + MIDI timing**

1. **Build:** Add `-dbackend=svg` to each niggun's LilyPond compile step to generate `.svg` alongside `.pdf`
2. **Build:** Parse the `.midi` file to extract a measure-by-measure timestamp map → `timing.json` per niggun
3. **Build:** Use LilyPond's `point-and-click` metadata embedded in the SVG to identify individual measure elements
4. **Frontend:** Embed SVG inline on the detail page; on audio `timeupdate`, look up current timestamp in `timing.json`, scroll to and highlight the current measure element

**Known hard parts:**
- LilyPond SVG elements use point-and-click coordinate links, not clean measure IDs — requires decoding
- MIDI timing must account for pickups, repeats, and mid-piece tempo changes
- Piano/multi-staff arrangements are more complex than single-voice nigguns
- Multi-page scores need page-turn handling

**Effort:** ~1 week of focused work

**Dependencies:** All nigguns must be rebuilt with SVG output; MIDI parser needed (e.g. `midi-parser-js` or Python `mido`)

---

## Key/Tempo Transposition UI

**Summary:** Dropdown to change the key (±3 semitones) or tempo (slow/normal/fast) with pre-generated variants.

**Approach:** Pre-generate all variants at CI time via `tools/build_variants.py` (not yet written). UI selector swaps the audio/PDF source URLs.

**Effort:** ~2–3 days (build script + UI wiring)

---

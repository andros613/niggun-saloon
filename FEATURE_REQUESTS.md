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

## Playback & Download Count Tracking

**Summary:** Track how many times each niggun is played and each file type (MP3, PDF, MIDI, LilyPond) is downloaded.

**Approach options:**
- **Lightweight (no backend):** Use a free tier of a counting service (e.g. Plausible, Fathom, or a simple counter API like countapi.xyz) — fire events from the audio `play` listener and download link clicks
- **Self-hosted:** A small serverless function (Cloudflare Worker, Vercel Edge) that increments a KV counter per niggun+event type; expose a read endpoint for an admin dashboard
- **GitHub-native:** Log events to a Google Sheet or Airtable via their API

**Notes:**
- Audio play events should debounce (e.g. only count after 10s of playback to avoid accidental counts)
- Download clicks are easy — intercept the `<a download>` click handler
- Stats could eventually be shown publicly per-niggun ("played 42 times")

**Effort:** ~1 day for basic event tracking; more for a dashboard

---

## Bug Reports & User Feedback

**Summary:** Let visitors submit bug reports or feedback directly from the site.

**Approach options:**
- **GitHub Issues link:** Simplest — a "Report a bug" link in the footer that opens a pre-filled GitHub issue template
- **Embedded form:** A small feedback form (e.g. Tally.so, Typeform free tier, or a plain `<form>` POSTing to a Formspree endpoint) on a `/feedback` page or in the footer
- **Per-niggun feedback:** A "suggest a correction" button on each detail page (e.g. for wrong lyrics, bad transliteration) — could open a pre-filled GitHub issue with the niggun name in the title

**Notes:**
- GitHub Issues is zero-infrastructure and already where the code lives
- A form is friendlier for non-technical users (the target audience)

**Effort:** ~2 hours for a GitHub Issues link + issue template; ~1 day for an embedded form

---

## Instrument Re-compilation (Select Instrument)

**Summary:** Allow users to select an instrument (e.g. piano, strings, organ) and re-compile the LilyPond source with that instrument's soundfont, generating a new MP3 on the fly or from pre-generated variants.

**Approach options:**
- **Pre-generated:** Build variants per instrument at CI time — each niggun compiled with multiple soundfonts; UI swaps the audio src URL. Simple, no backend needed.
- **On-demand (server):** A small serverless function accepts a niggun + instrument selection, runs LilyPond + FluidSynth, returns the MP3. More flexible but requires infrastructure.

**Notes:**
- Pre-generated is simpler and consistent with the existing build pipeline (`build_variants.py`, not yet written)
- Instrument list would map to FluidSynth soundfont program numbers
- Could combine with Key/Tempo Transposition UI into a single "playback options" panel

**Effort:** ~1–2 days for pre-generated instrument variants (build script + UI); more for on-demand

---

## Transliteration Style Selection + PDF Variants

**Summary:** Allow selecting a transliteration style (Tehillat Hashem, ArtScroll Ashkenazi, Modern Israeli) for both the follow-along lyrics in the UI and the downloadable PDF.

**Context:** Some nigguns already have multiple PDF versions compiled from LilyPond (different lyric inclusions). The UI currently shows a single PDF download and inline lyrics from separate text files.

**Approach:**
- **PDF selection:** Detect multiple PDFs in the niggun dir (e.g. `stem_th.pdf`, `stem_ashk.pdf`) at build time; expose a dropdown to choose which PDF to view/download
- **Inline lyrics:** Already stored per-style in separate text files (`words_th_en.txt`, `words_as_ashk.txt`) — the UI already shows all available columns; a toggle could show only the selected style
- **Build:** `build_metadata.py` would enumerate available PDF variants and include them in `metadata.json`

**Effort:** ~1 day for PDF variant detection + UI switcher; lyrics toggle is simpler still

---

## Key/Tempo Transposition UI

**Summary:** Dropdown to change the key (±3 semitones) or tempo (slow/normal/fast) with pre-generated variants.

**Approach:** Pre-generate all variants at CI time via `tools/build_variants.py` (not yet written). UI selector swaps the audio/PDF source URLs.

**Effort:** ~2–3 days (build script + UI wiring)

---

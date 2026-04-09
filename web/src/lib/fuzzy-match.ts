/**
 * fuzzy-match.ts — standalone fuzzy string matching with transliteration normalization.
 *
 * Zero dependencies. Works in browser and Node.js (ES2018+).
 *
 * Core API:
 *   fuzzyMatch(query, target, opts?) → boolean
 *   fuzzyScore(query, target, opts?) → number  (0-1)
 *
 * Algorithm:
 *   1. Normalize both strings (apply rules, lowercase)
 *   2. Exact substring match after normalization → score 1.0
 *   3. Split into words; for each query word find best-scoring target word via:
 *      a. Target word starts with query word (prefix)  → 0.9
 *      b. Substring containment (either direction)     → 0.85
 *      c. Trigram Dice-coefficient similarity
 *   4. Overall score = min of per-query-word scores (every word must match)
 *
 * Built-in normalization (HEBREW_NORM_RULES) handles Hebrew/Yiddish transliteration:
 *   apostrophes stripped  (', \u2018, \u2019, \u02BC, `)
 *   q  → k               (qedushah ↔ kedushah)
 *   kh → h               (mikhael ↔ mihael)
 *   ch → h               (chanukah ↔ hanukah)
 *   th → t               (shabbath ↔ shabbat)
 *   tz → ts              (tzaddik ↔ tsaddik)
 *   z  → ts              (zayin ↔ tsayin)
 *   ei → e               (beinoni ↔ benoni, sheyibone ↔ sheybone)
 *   ay → e               (shayibone ↔ sheyibone)
 *   ai → e               (chai variant forms)
 *   o  → a               (vowel interchange; shabbos vowel ↔ shabbat vowel)
 *   word-final s → t     (shabbos/shabbas ↔ shabbat, words ≥ 4 chars only —
 *                         shorter words and internal s are left unchanged so
 *                         3-char prefix searches like "mis" still work)
 *   double consonants → single (hanukkah ↔ hanukah, shabbat ↔ shabat)
 *
 * To reuse in other projects: copy this file. Pass `normRules: []` to skip
 * Hebrew/Yiddish normalization, or supply your own rule list.
 */

// ---------------------------------------------------------------------------
// Types
// ---------------------------------------------------------------------------

/** A [pattern, replacement] pair applied via String.prototype.replace. */
export type NormRule = [RegExp, string];

export interface FuzzyMatchOptions {
  /** Minimum score to count as a match (0-1). Default: 0.45 */
  threshold?: number;
  /**
   * Normalization rules applied (in order) to both query and target before
   * comparison. Default: HEBREW_NORM_RULES. Pass [] to disable normalization.
   */
  normRules?: NormRule[];
}

// ---------------------------------------------------------------------------
// Normalization
// ---------------------------------------------------------------------------

/**
 * Default rules for Hebrew/Yiddish transliteration normalization.
 *
 * Rule ordering is significant:
 *   1. Apostrophe removal first — clean punctuation before any letter rules.
 *   2. q → k before digraph rules.
 *   3. Digraphs (kh, ch, th) before single-letter rules that overlap with them.
 *   4. Sibilant canonicalization (tz then z → ts) — tz handled as unit first.
 *   5. Vowel normalization (ei, ay, ai, o).
 *   6. Word-final s → t for words ≥ 4 chars (lookbehind (?<=\w{3,})).
 *      This handles Ashkenazi -os/-as vs Sephardic -at/-et endings without
 *      clobbering 3-char prefix queries that end in 's' (e.g. "mis", "nas").
 *   7. Double-consonant collapse last — catches pairs from all prior rules.
 */
export const HEBREW_NORM_RULES: NormRule[] = [
  // 1. Remove apostrophes — straight ' (U+0027), left ' (U+2018), right ' (U+2019),
  //    modifier letter apostrophe (U+02BC), backtick `
  [/['\u2018\u2019\u02BC`]/g, ''],

  // 2. Single-letter substitution
  [/q/g, 'k'],          // q → k  (qedushah ↔ kedushah)

  // 3. Digraphs — longer patterns before single-letter rules that overlap
  [/kh/g, 'h'],         // kh → h  (mikhael ↔ mihael)
  [/ch/g, 'h'],         // ch → h  (chanukah ↔ hanukah)
  [/th/g, 't'],         // th → t  (shabbath ↔ shabbat; Ashkenazi tav)

  // 4. Sibilant canonicalization
  [/tz/g, 'ts'],        // tz → ts  (tzaddik ↔ tsaddik; handled as unit before z rule)
  [/z/g,  'ts'],        // z  → ts  (zayin; remaining z after tz rule)

  // 5. Vowel normalization
  [/ei/g, 'e'],         // ei → e  (beinoni ↔ benoni, sheyibone ↔ sheybone)
  [/ay/g, 'e'],         // ay → e  (shayibone ↔ sheyibone)
  [/ai/g, 'e'],         // ai → e  (chai variant forms)
  [/o/g,  'a'],         // o  → a  (vowel interchange; shabbos vowel ↔ shabbat)

  // 6. Word-final s → t, but only for words of 4+ chars (lookbehind on ≥3 preceding \w).
  //    Shorter words and internal s are left untouched, so prefix searches like
  //    "mis" (→ stays "mis") still match "mishenichnas" (internal s preserved).
  [/(?<=\w{3,})s\b/g, 't'],

  // 7. Collapse one layer of doubles — catches pairs created by earlier rules:
  //    kk→k, hh→h, bb→b, tt→t, hanukkah→hanukah, shabbat→shabat, etc.
  [/(.)\1/g, '$1'],
];

function applyNorm(s: string, rules: NormRule[]): string {
  s = s.toLowerCase().trim();
  for (const [re, rep] of rules) s = s.replace(re, rep);
  return s;
}

// ---------------------------------------------------------------------------
// Trigram similarity (Dice coefficient)
// ---------------------------------------------------------------------------

function makeTrigrams(s: string): Set<string> {
  const set = new Set<string>();
  const p = ` ${s} `;                          // pad for edge trigrams
  for (let i = 0; i <= p.length - 3; i++) set.add(p.slice(i, i + 3));
  return set;
}

function trigramSim(a: string, b: string): number {
  if (!a || !b) return 0;
  const ta = makeTrigrams(a);
  const tb = makeTrigrams(b);
  let shared = 0;
  for (const t of ta) if (tb.has(t)) shared++;
  return (2 * shared) / (ta.size + tb.size);
}

// ---------------------------------------------------------------------------
// Per-word scoring
// ---------------------------------------------------------------------------

function bestWordScore(qw: string, tWords: string[]): number {
  let best = 0;
  for (const tw of tWords) {
    if (tw.startsWith(qw))                    { best = Math.max(best, 0.9);  continue; }
    if (tw.includes(qw) || qw.includes(tw))   { best = Math.max(best, 0.85); continue; }
    best = Math.max(best, trigramSim(qw, tw));
  }
  return best;
}

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------

/**
 * Returns a score in [0, 1] for how well query matches target.
 * 1.0 = exact substring match (after normalization). 0.0 = no similarity.
 */
export function fuzzyScore(
  query: string,
  target: string,
  opts: FuzzyMatchOptions = {},
): number {
  const rules = opts.normRules ?? HEBREW_NORM_RULES;

  if (!query)  return 1;
  if (!target) return 0;

  const q = applyNorm(query, rules);
  const t = applyNorm(target, rules);

  // Fast path: exact substring after normalization
  if (t.includes(q)) return 1;

  // Very short queries (original length) require exact substring only — avoid noise.
  // Check original length so e.g. "ach" (3 chars → normalized "ah") still proceeds.
  if (query.trim().length <= 2) return 0;

  const qWords = q.split(/\s+/).filter(Boolean);
  const tWords = t.split(/\s+/).filter(Boolean);

  if (!qWords.length) return 1;

  // Score each query word; all must match for the overall result to pass
  const scores = qWords.map(qw =>
    qw.length <= 2
      ? (tWords.some(tw => tw.includes(qw)) ? 1 : 0)  // short normalized words: substring only
      : bestWordScore(qw, tWords),
  );

  return Math.min(...scores);
}

/**
 * Returns true if query fuzzy-matches target.
 */
export function fuzzyMatch(
  query: string,
  target: string,
  opts: FuzzyMatchOptions = {},
): boolean {
  const threshold = opts.threshold ?? 0.45;
  return fuzzyScore(query, target, opts) >= threshold;
}

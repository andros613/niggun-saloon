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
 *   1. Normalize full strings and check exact substring match → score 1.0 (fast path)
 *   2. Tokenize query and target; filter stopwords from target tokens
 *   3. For each query token find best-scoring target token via:
 *      a. Target token starts with query token (prefix)    → 0.9
 *      b. Substring containment (either direction, tw≥3)  → 0.85
 *      c. Trigram Dice-coefficient similarity
 *   4. Overall score = min of per-query-token scores (every token must match)
 *
 * Normalization rules (HEBREW_NORM_RULES) handle Hebrew/Yiddish transliteration.
 * Stopwords (ENGLISH_STOPWORDS) are filtered from target tokens before scoring
 * so subtitle filler ("folk song based on...") doesn't drive false positives.
 *
 * To reuse in other projects: copy this file. Pass `normRules: []` and/or
 * `stopwords: new Set()` to disable normalization or stopword filtering.
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
   * Normalization rules applied (in order) to both query and target.
   * Default: HEBREW_NORM_RULES. Pass [] to disable.
   */
  normRules?: NormRule[];
  /**
   * Words (pre-normalization, lowercase) to strip from target tokens before
   * scoring. Prevents subtitle filler from causing false positives.
   * Default: ENGLISH_STOPWORDS. Pass new Set() to disable.
   */
  stopwords?: ReadonlySet<string>;
}

// ---------------------------------------------------------------------------
// Normalization
// ---------------------------------------------------------------------------

/**
 * Default rules for Hebrew/Yiddish transliteration normalization.
 *
 * Rule ordering is significant — see inline comments.
 * Key constraint: word-final s→t (rule 6) must run BEFORE vowel rules (7-9)
 * so that e.g. "beis" (4 chars) triggers s→t before ei→e shrinks it to "bes"
 * (3 chars, which would then fail the ≥3-preceding-chars lookbehind).
 */
export const HEBREW_NORM_RULES: NormRule[] = [
  // 1. Remove apostrophes — straight ' (U+0027), curly '\u2018/\u2019,
  //    modifier letter apostrophe \u02BC, backtick `
  [/['\u2018\u2019\u02BC`]/g, ''],

  // 2. Single-letter substitution
  [/q/g, 'k'],          // q → k  (qedushah ↔ kedushah)

  // 3. Digraphs (longer patterns before overlapping single-letter rules)
  [/kh/g, 'h'],         // kh → h  (mikhael ↔ mihael)
  [/ch/g, 'h'],         // ch → h  (chanukah ↔ hanukah)
  [/th/g, 't'],         // th → t  (shabbath ↔ shabbat)

  // 4. Sibilant canonicalization
  [/tz/g, 'ts'],        // tz → ts  (tzaddik ↔ tsaddik; handled as unit before z)
  [/z/g,  'ts'],        // z  → ts  (zayin)

  // 5. Word-final s → t, words of 4+ chars only (lookbehind on ≥3 preceding \w).
  //    MUST run before vowel rules: "beis" (4 chars) → "beit" here, then "bet"
  //    via ei→e. If ei→e ran first, "beis"→"bes" (3 chars) and the lookbehind
  //    would fail (only 2 preceding chars "be"), breaking beis ↔ beit matching.
  //    Also handles: shabbos→shabbat, shabbas→shabbat (after o→a / a stays).
  [/(?<=\w{3,})s\b/g, 't'],

  // 6. Vowel normalization
  [/ei/g, 'e'],         // ei → e  (beinoni ↔ benoni, sheyibone ↔ sheybone)
  [/ay/g, 'e'],         // ay → e  (shayibone ↔ sheyibone)
  [/ai/g, 'e'],         // ai → e  (chai variant forms)
  [/o/g,  'a'],         // o  → a  (vowel interchange; shabbos vowel ↔ shabbat)

  // 7. Collapse one layer of doubles — catches pairs from all prior rules
  [/(.)\1/g, '$1'],
];

function applyNorm(s: string, rules: NormRule[]): string {
  s = s.toLowerCase().trim();
  for (const [re, rep] of rules) s = s.replace(re, rep);
  return s;
}

// ---------------------------------------------------------------------------
// Stopwords
// ---------------------------------------------------------------------------

/**
 * Common English words filtered from target tokens before scoring.
 * These are pre-normalization lowercase forms. Prevents words in subtitles
 * like "based on", "popular in", "folk song" from polluting match scores
 * (especially after aggressive vowel normalization turns "on"→"an" etc.).
 */
export const ENGLISH_STOPWORDS: ReadonlySet<string> = new Set([
  'a', 'an', 'and', 'the', 'or', 'of', 'for', 'with', 'in', 'on', 'at',
  'to', 'by', 'as', 'is', 'it', 'be', 'from', 'after', 'based', 'popular',
]);

/** Split, filter stopwords, normalize. Used for per-token scoring. */
function tokenize(s: string, rules: NormRule[], sw: ReadonlySet<string>): string[] {
  return s.toLowerCase().trim()
    .split(/[\s&()\[\],]+/)
    .filter(w => w.length > 0 && !sw.has(w))
    .map(w => applyNorm(w, rules))
    .filter(Boolean);
}

// ---------------------------------------------------------------------------
// Trigram similarity (Dice coefficient)
// ---------------------------------------------------------------------------

function makeTrigrams(s: string): Set<string> {
  const set = new Set<string>();
  const p = ` ${s} `;
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
// Per-token scoring
// ---------------------------------------------------------------------------

function bestWordScore(qw: string, tWords: string[]): number {
  let best = 0;
  for (const tw of tWords) {
    if (tw.startsWith(qw))                         { best = Math.max(best, 0.9);  continue; }
    if (tw.includes(qw))                           { best = Math.max(best, 0.85); continue; }
    // Reverse containment: only when tw is substantial (≥3 chars) so that
    // 2-char normalization artifacts that slip past stopword filtering don't match.
    if (tw.length >= 3 && qw.includes(tw))         { best = Math.max(best, 0.85); continue; }
    best = Math.max(best, trigramSim(qw, tw));
  }
  return best;
}

// ---------------------------------------------------------------------------
// Public API
// ---------------------------------------------------------------------------

/**
 * Returns a score in [0, 1] for how well query matches target.
 * 1.0 = exact substring match after normalization. 0.0 = no similarity.
 */
export function fuzzyScore(
  query: string,
  target: string,
  opts: FuzzyMatchOptions = {},
): number {
  const rules = opts.normRules ?? HEBREW_NORM_RULES;
  const sw    = opts.stopwords ?? ENGLISH_STOPWORDS;

  if (!query)  return 1;
  if (!target) return 0;

  // Fast path: exact substring on fully-normalized strings (no stopword filtering).
  // Covers the common case of typing a niggun name directly.
  const qNorm = applyNorm(query, rules);
  const tNorm = applyNorm(target, rules);
  if (tNorm.includes(qNorm)) return 1;

  // Very short original queries: no fuzzy (avoid noise).
  if (query.trim().length <= 2) return 0;

  // Per-token scoring with stopword filtering.
  const qWords = tokenize(query, rules, new Set());  // keep all query tokens
  const tWords = tokenize(target, rules, sw);         // filter stopwords from target

  if (!qWords.length) return 1;   // query was all stopwords → match everything
  if (!tWords.length) return 0;   // target was all stopwords → nothing to match against

  const scores = qWords.map(qw =>
    qw.length <= 2
      ? (tWords.some(tw => tw.includes(qw)) ? 1 : 0)  // short token: substring only
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

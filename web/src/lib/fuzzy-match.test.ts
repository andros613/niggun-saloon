import { describe, it, expect } from 'vitest';
import { fuzzyMatch, fuzzyScore, HEBREW_NORM_RULES } from './fuzzy-match';

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

/** Assert query fuzzy-matches target (default threshold 0.45). */
function expectMatch(query: string, target: string) {
  const score = fuzzyScore(query, target);
  expect(score, `"${query}" vs "${target}" score=${score.toFixed(3)}`).toBeGreaterThanOrEqual(0.45);
}

/** Assert query does NOT fuzzy-match target. */
function expectNoMatch(query: string, target: string) {
  const score = fuzzyScore(query, target);
  expect(score, `"${query}" vs "${target}" should NOT match (score=${score.toFixed(3)})`).toBeLessThan(0.45);
}

// ---------------------------------------------------------------------------
// Apostrophe removal
// ---------------------------------------------------------------------------

describe('apostrophe removal', () => {
  it("strips straight apostrophe '", () => expectMatch("b'nei", 'bnei'));
  it('strips left single quote \u2018', () => expectMatch('\u2018bnei', 'bnei'));
  it('strips right single quote / apostrophe \u2019', () => expectMatch('b\u2019nei', 'bnei'));
  it('strips modifier letter apostrophe \u02BC', () => expectMatch('b\u02BCnei', 'bnei'));
  it('strips backtick `', () => expectMatch('b`nei', 'bnei'));
  it('both sides stripped', () => expectMatch("b'nei", "b'nei melech"));
});

// ---------------------------------------------------------------------------
// q → k
// ---------------------------------------------------------------------------

describe('q → k', () => {
  it('qedushah matches kedushah', () => expectMatch('qedushah', 'kedushah'));
  it('kedushah matches qedushah target', () => expectMatch('kedushah', 'qedushah'));
  it('qabbalah matches kabbalah', () => expectMatch('qabbalah', 'kabbalah'));
});

// ---------------------------------------------------------------------------
// ch / kh → h
// ---------------------------------------------------------------------------

describe('ch / kh → h', () => {
  it('chanukah matches hanukah', () => expectMatch('chanukah', 'hanukah'));
  it('hanukah matches chanukah', () => expectMatch('hanukah', 'chanukah'));
  it('mikhael matches mihael', () => expectMatch('mikhael', 'mihael'));
  it('mishenichnas matches mishenikhnas', () => expectMatch('mishenichnas', 'mishenikhnas'));
  it('nachamu matches nahamu', () => expectMatch('nachamu', 'nahamu'));
});

// ---------------------------------------------------------------------------
// th → t
// ---------------------------------------------------------------------------

describe('th → t', () => {
  it('shabbath matches shabbat', () => expectMatch('shabbath', 'shabbat'));
  it('shabbat matches shabbath', () => expectMatch('shabbat', 'shabbath'));
  it('berith matches berit', () => expectMatch('berith', 'berit'));
});

// ---------------------------------------------------------------------------
// tz / z → ts
// ---------------------------------------------------------------------------

describe('tz / z → ts', () => {
  it('tzaddik matches tsaddik', () => expectMatch('tzaddik', 'tsaddik'));
  it('tsaddik matches tzaddik', () => expectMatch('tsaddik', 'tzaddik'));
  it('zayin matches tsayin', () => expectMatch('zayin', 'tsayin'));
  it('tsayin matches zayin', () => expectMatch('tsayin', 'zayin'));
  it('mitzva matches mitsva', () => expectMatch('mitzva', 'mitsva'));
  it('mitzvah matches mitsvah', () => expectMatch('mitzvah', 'mitsvah'));
});

// ---------------------------------------------------------------------------
// ei → e
// ---------------------------------------------------------------------------

describe('ei → e', () => {
  it('beinoni matches benoni', () => expectMatch('beinoni', 'benoni'));
  it('benoni matches beinoni', () => expectMatch('benoni', 'beinoni'));
  it('sheyibone variants match', () => expectMatch('sheyibone', 'sheyibaneh'));
});

// ---------------------------------------------------------------------------
// ay → e
// ---------------------------------------------------------------------------

describe('ay → e', () => {
  it('shayibone matches sheyibone', () => expectMatch('shayibone', 'sheyibone'));
  it('sheyibone matches shayibone', () => expectMatch('sheyibone', 'shayibone'));
});

// ---------------------------------------------------------------------------
// ai → e
// ---------------------------------------------------------------------------

describe('ai → e', () => {
  it('chai matches chei', () => expectMatch('chai', 'chei'));
  it('laila matches leila', () => expectMatch('laila', 'leila'));
});

// ---------------------------------------------------------------------------
// o → a (a/o interchangeable)
// ---------------------------------------------------------------------------

describe('o → a (vowel interchange)', () => {
  it('shabbos vowel matches shabbat vowel', () => expectMatch('shabbos', 'shabbat'));
  it('shabbat matches shabbos', () => expectMatch('shabbat', 'shabbos'));
  it('kol matches kal', () => expectMatch('kol', 'kal'));
  // Note: "kel" vs "kol" do NOT match — they have different vowels (e vs o/a)
  // after normalization; this is correct behaviour.
});

// ---------------------------------------------------------------------------
// Word-final s → t (≥4 char words only)
// ---------------------------------------------------------------------------

describe('word-final s → t (Ashkenazi/Sephardic endings, ≥4 chars)', () => {
  it('shabbos matches shabbat', () => expectMatch('shabbos', 'shabbat'));
  it('shabbas matches shabbat', () => expectMatch('shabbas', 'shabbat'));
  it('shabbat matches shabbos', () => expectMatch('shabbat', 'shabbos'));
  it('nachamus matches nachamu', () => expectMatch('nachamus', 'nachamu'));
  it('mishenichnas still matches itself (internal s preserved)', () =>
    expectMatch('mishenichnas', 'mishenichnas'));
  // 3-char prefix ending in s is NOT converted (lookbehind guard)
  it('"mis" prefix stays "mis" and matches "Mishenichnas Adar"', () =>
    expectMatch('mis', 'Mishenichnas Adar'));
});

// ---------------------------------------------------------------------------
// Double-consonant collapse
// ---------------------------------------------------------------------------

describe('double consonant collapse', () => {
  it('hanukkah matches hanukah', () => expectMatch('hanukkah', 'hanukah'));
  it('hanukah matches hanukkah', () => expectMatch('hanukah', 'hanukkah'));
  it('shabbat matches shabat', () => expectMatch('shabbat', 'shabat'));
  it('shabat matches shabbat', () => expectMatch('shabat', 'shabbat'));
  it('chanukah matches chanukkah', () => expectMatch('chanukah', 'chanukkah'));
});

// ---------------------------------------------------------------------------
// Combined / real-world variants
// ---------------------------------------------------------------------------

describe('combined real-world variants', () => {
  it('chanukah ↔ hanukkah (ch→h + double)', () => expectMatch('chanukah', 'hanukkah'));
  it('hanukkah ↔ chanukah', () => expectMatch('hanukkah', 'chanukah'));
  it('shabbos ↔ shabbath (word-final s + th)', () => expectMatch('shabbos', 'shabbath'));
  it('tzaddik ↔ tsaddik ↔ zadik (all sibilant forms)', () => {
    expectMatch('tzaddik', 'zadik');
    expectMatch('zadik', 'tsaddik');
    expectMatch('tsaddik', 'tzaddik');
  });
  it('beinoni typo "binoni"', () => expectMatch('binoni', 'Beinoni'));
  it('acheinu typo "acheino"', () => expectMatch('acheino', 'Acheinu'));
  it('multi-word: "mishen adar"', () => expectMatch('mishen adar', 'Mishenichnas Adar'));
});

// ---------------------------------------------------------------------------
// Prefix / partial matching
// ---------------------------------------------------------------------------

describe('prefix / partial matching', () => {
  it('"nach" matches "Nachamu"', () => expectMatch('nach', 'Nachamu'));
  // "ach" normalises to "ah" (ch→h), but original length 3 > 2 so it still proceeds;
  // "ah" is a substring of normalised "Acheinu" → "ahenu" → fast-path hit.
  it('"ach" matches "Acheinu"', () => expectMatch('ach', 'Acheinu'));
  it('"mis" matches "Mishenichnas Adar"', () => expectMatch('mis', 'Mishenichnas Adar'));
  it('"bein" matches "Beinoni"', () => expectMatch('bein', 'Beinoni'));
});

// ---------------------------------------------------------------------------
// Should NOT match (sanity checks against false positives)
// ---------------------------------------------------------------------------

describe('non-matches', () => {
  it('"xyz" does not match "Nachamu"', () => expectNoMatch('xyz', 'Nachamu'));
  // "dayenu" and "acheinu" both end in "-enu", but after normalization
  // "dayenu" → "denu" and "acheinu" → "ahenu": different stems, score < 0.45.
  it('"dayenu" does not match "Acheinu"', () => expectNoMatch('dayenu', 'Acheinu'));
  it('"purim" does not match "Pesach"', () => expectNoMatch('purim', 'Pesach'));
  it('empty query always matches (score 1)', () => {
    expect(fuzzyScore('', 'anything')).toBe(1);
  });
  it('empty target returns score 0', () => {
    expect(fuzzyScore('query', '')).toBe(0);
  });
  // A 2-char query that IS a real substring still matches (fast-path exact hit).
  // The length guard prevents fuzzy trigram noise, not exact substring hits.
  it('2-char query exact substring still scores 1', () => {
    expect(fuzzyScore('ab', 'abcdef')).toBe(1);
  });
  it('2-char query that is not a substring returns 0 (no fuzzy below 3 chars)', () => {
    expect(fuzzyScore('ab', 'cdefgh')).toBe(0);
  });
});

// ---------------------------------------------------------------------------
// normRules: [] — disable normalization
// ---------------------------------------------------------------------------

describe('normRules: [] (no normalization)', () => {
  it('chanukah does NOT score 1.0 against hanukah when normalization off', () => {
    expect(fuzzyScore('chanukah', 'hanukah', { normRules: [] })).toBeLessThan(1);
  });
  it('exact match still scores 1.0 with normRules: []', () => {
    expect(fuzzyScore('shabbat', 'shabbat', { normRules: [] })).toBe(1);
  });
});

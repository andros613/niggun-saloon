import fs from 'node:fs';
import path from 'node:path';

export interface NiggunAssets {
  has_ly: boolean;
  has_pdf: boolean;
  has_mp3: boolean;
  has_midi: boolean;
  has_words_he: boolean;
  has_words_en: boolean;
  has_words_th_en: boolean;
  has_words_as_ashk: boolean;
  has_versions_dir: boolean;
}

export interface Reference {
  url: string;
  label: string | null;
  type: 'youtube' | 'chabad_media' | 'link';
  embed_id?: string;  // YouTube video ID
}

export interface Niggun {
  id: string;
  dir: string;
  title: string;
  subtitle: string;
  arranger: string;
  date_gregorian: string | null;
  date_hebrew: string | null;
  version: string | null;
  license: string | null;
  key: string | null;
  tempo_bpm: number | null;
  description: string;
  variant_of: string | null;
  arrangement_type: 'piano' | 'choral' | null;
  piano_arrangements: string[];
  choral_arrangements: string[];
  assets: NiggunAssets;
  references: Reference[];
  tags: string[];
}

export interface Catalog {
  generated_at: string;
  count: number;
  nigguns: Niggun[];
}

/** Load catalog.json from the repo root at build time. */
export function loadCatalog(): Catalog {
  // process.cwd() is web/ when running `npm run build` from web/
  const catalogPath = path.resolve(process.cwd(), '..', 'catalog.json');
  const raw = fs.readFileSync(catalogPath, 'utf-8');
  return JSON.parse(raw) as Catalog;
}

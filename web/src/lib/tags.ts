import fs from 'node:fs';
import path from 'node:path';

interface TagDef { slug: string; label: string; }

function loadTagDefs(): TagDef[] {
  const p = path.resolve(process.cwd(), '..', 'tag_defs.json');
  return JSON.parse(fs.readFileSync(p, 'utf-8')) as TagDef[];
}

const tagDefs = loadTagDefs();

/** Ordered list of tag slugs for display. */
export const allTags: string[] = tagDefs.map(t => t.slug);

/** Map from slug → display label. */
export const TAG_LABELS: Record<string, string> = Object.fromEntries(
  tagDefs.map(t => [t.slug, t.label])
);

/** Return display label for a tag slug, falling back to the slug itself. */
export function tagLabel(slug: string): string {
  return TAG_LABELS[slug] ?? slug;
}

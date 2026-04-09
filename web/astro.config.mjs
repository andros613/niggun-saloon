// @ts-check
import { defineConfig } from 'astro/config';
import react from '@astrojs/react';

// https://astro.build/config
export default defineConfig({
  // GitHub Pages deploys to https://<org>.github.io/<repo>/
  // Set site + base so all asset URLs are correct.
  // Update these when the org/repo name is finalised on GitHub.
  site: 'https://andros613.github.io',
  base: '/niggun-saloon/',
  output: 'static',
  integrations: [react()],
});
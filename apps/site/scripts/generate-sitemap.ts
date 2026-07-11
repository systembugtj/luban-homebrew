/**
 * Generate sitemap.xml for GitHub Pages (History API routes under project base).
 */

import { writeFileSync } from 'fs';
import { join } from 'path';

const BASE_URL = process.env.VITE_SITE_URL || 'https://www.systembug.me/luban-homebrew';

const routes = [
  '/',
  '/formulas',
  '/docs/guide/getting-started',
  '/docs/guide/installation',
  '/docs/guide/usage',
  '/docs/reference/formulas',
  '/docs/faq/index',
];

function generateSitemap(): string {
  const urls = routes
    .map(
      (route) => `  <url>
    <loc>${BASE_URL}${route}</loc>
    <changefreq>weekly</changefreq>
    <priority>${route === '/' ? '1.0' : '0.8'}</priority>
  </url>`,
    )
    .join('\n');

  return `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${urls}
</urlset>`;
}

const outputPath = join(process.cwd(), 'public', 'sitemap.xml');
writeFileSync(outputPath, generateSitemap(), 'utf-8');
console.log(`✅ Sitemap generated: ${outputPath}`);

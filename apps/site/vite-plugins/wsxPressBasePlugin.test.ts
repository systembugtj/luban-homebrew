import { describe, expect, it } from 'vitest';
import { transformWsxPressClient } from './wsxPressBasePlugin';

describe('transformWsxPressClient', () => {
  it('rewrites fetch URLs and doc route parsing for GitHub Pages subpath', () => {
    const input = `
      fetch("/.wsx-press/docs-meta.json");
      const markdownPath = \`/docs/\${docPath}.md\`;
      if (routeInfo.path.startsWith("/docs/")) {
        docPath = routeInfo.path.slice(6); // 移除 "/docs/"
      }
      if (e.path.startsWith("/docs/"))
        r = e.path.slice(6);
    `;

    const output = transformWsxPressClient(input, '/luban-homebrew/');
    expect(output).toContain('fetch("/luban-homebrew/.wsx-press/docs-meta.json")');
    expect(output).toContain('`/luban-homebrew/docs/${docPath}.md`');
    expect(output).toContain("routeInfo.path.includes('/docs/')");
    expect(output).toContain("routeInfo.path.split('/docs/')[1]");
    expect(output).toContain("e.path.includes('/docs/')");
    expect(output).toContain("e.path.split('/docs/')[1]");
  });

  it('leaves dev source unchanged', () => {
    const input = 'fetch("/.wsx-press/docs-meta.json");';
    expect(transformWsxPressClient(input, '/')).toBe(input);
  });
});

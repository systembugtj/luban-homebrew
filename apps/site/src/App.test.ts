import { describe, it, expect } from 'vitest';
import {
  TAP_GITHUB_USER,
  TAP_ID,
  TAP_REPO,
  INSTALL_SCRIPT_URL,
  SITE_URL,
} from './constants/tap';
import { joinSitePath, siteAsset, sitePath } from './sitePaths';

describe('tap constants', () => {
  it('uses the luban-homebrew tap id', () => {
    expect(TAP_GITHUB_USER).toBe('systembugtj');
    expect(TAP_REPO).toBe('luban-homebrew');
    expect(TAP_ID).toBe('systembugtj/luban-homebrew');
  });

  it('builds site URLs for custom domain hosting', () => {
    expect(SITE_URL).toBe('https://www.systembug.me/luban-homebrew');
    expect(INSTALL_SCRIPT_URL).toBe(`${SITE_URL}/install.js`);
  });
});

describe('joinSitePath', () => {
  it('returns root for home in dev', () => {
    expect(joinSitePath('/', '/')).toBe('/');
    expect(joinSitePath('/', '/formulas')).toBe('/formulas');
  });

  it('prefixes routes with GitHub Pages base', () => {
    expect(joinSitePath('/luban-homebrew/', '/')).toBe('/luban-homebrew/');
    expect(joinSitePath('/luban-homebrew/', '/formulas')).toBe('/luban-homebrew/formulas');
    expect(joinSitePath('/luban-homebrew/', '/docs/guide/getting-started')).toBe(
      '/luban-homebrew/docs/guide/getting-started',
    );
  });
});

describe('sitePath', () => {
  it('prefixes routes with Vite base', () => {
    expect(sitePath('/formulas')).toBe('/luban-homebrew/formulas');
    expect(sitePath('/')).toBe('/luban-homebrew/');
  });

  it('prefixes static assets', () => {
    expect(siteAsset('locales/en/home.json')).toBe('/luban-homebrew/locales/en/home.json');
  });
});

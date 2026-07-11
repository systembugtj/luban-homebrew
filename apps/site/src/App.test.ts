import { describe, it, expect } from 'vitest';
import {
  TAP_GITHUB_USER,
  TAP_ID,
  TAP_REPO,
  INSTALL_SCRIPT_URL,
  SITE_URL,
} from './constants/tap';

describe('tap constants', () => {
  it('uses the luban-homebrew tap id', () => {
    expect(TAP_GITHUB_USER).toBe('systembugtj');
    expect(TAP_REPO).toBe('luban-homebrew');
    expect(TAP_ID).toBe('systembugtj/luban-homebrew');
  });

  it('builds GitHub Pages URLs from tap repo name', () => {
    expect(SITE_URL).toBe('https://systembugtj.github.io/luban-homebrew');
    expect(INSTALL_SCRIPT_URL).toBe(`${SITE_URL}/install.js`);
  });
});

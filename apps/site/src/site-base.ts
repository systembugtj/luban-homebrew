/** GitHub Pages subpath helpers (VITE_BASE=/luban-homebrew/). */

const RAW_BASE = import.meta.env.BASE_URL;
export const SITE_BASE = RAW_BASE.endsWith('/') ? RAW_BASE : `${RAW_BASE}/`;

/** Prefix an app route for wsx-router / wsx-link (e.g. /formulas → /luban-homebrew/formulas). */
export function sitePath(route: string): string {
  const normalizedRoute = route.startsWith('/') ? route : `/${route}`;
  if (normalizedRoute === '/') {
    return SITE_BASE.replace(/\/$/, '') || '/';
  }
  return `${SITE_BASE.replace(/\/$/, '')}${normalizedRoute}`;
}

/** Resolve static public assets (locales, favicon, install.js). */
export function siteAsset(path: string): string {
  const normalized = path.startsWith('/') ? path.slice(1) : path;
  return `${SITE_BASE}${normalized}`;
}

/** Patch absolute /.wsx-press/* fetches for subpath hosting. */
export function patchPressFetchBase(): void {
  const base = SITE_BASE.replace(/\/$/, '');
  const originalFetch = window.fetch.bind(window);

  window.fetch = (input: RequestInfo | URL, init?: RequestInit) => {
    if (typeof input === 'string' && input.startsWith('/.wsx-press/')) {
      return originalFetch(`${base}${input}`, init);
    }
    return originalFetch(input, init);
  };
}

/** Redirect /luban-homebrew → /luban-homebrew/ for consistent route matching. */
export function normalizeTrailingSlash(): void {
  const baseNoSlash = SITE_BASE.replace(/\/$/, '');
  if (window.location.pathname === baseNoSlash) {
    window.history.replaceState(null, '', `${baseNoSlash}/`);
  }
}

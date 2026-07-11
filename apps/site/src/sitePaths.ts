/** Join Vite `base` with an app route (History API pathname). */
export function joinSitePath(base: string, route: string): string {
  const normalizedBase = base.endsWith('/') ? base.slice(0, -1) : base;

  if (route === '/' || route === '') {
    return base === '/' ? '/' : `${base.endsWith('/') ? base : `${base}/`}`;
  }

  const segment = route.startsWith('/') ? route : `/${route}`;
  return normalizedBase ? `${normalizedBase}${segment}` : segment;
}

/** Vite `base` — `/` in dev, `/luban-homebrew/` on GitHub Pages. */
export const SITE_BASE = import.meta.env.BASE_URL;

export function sitePath(route: string): string {
  return joinSitePath(SITE_BASE, route);
}

/** Resolve static public assets (locales, favicon, install.js). */
export function siteAsset(path: string): string {
  const normalized = path.startsWith('/') ? path.slice(1) : path;
  return `${SITE_BASE}${normalized}`;
}

/** Normalize `/luban-homebrew` → `/luban-homebrew/` so home route matching is stable. */
export function normalizeSitePathname(): void {
  if (SITE_BASE === '/') {
    return;
  }

  const home = sitePath('/');
  const bareHome = home.endsWith('/') ? home.slice(0, -1) : home;
  const { pathname } = window.location;

  if (pathname === bareHome && home.endsWith('/')) {
    window.history.replaceState(null, '', home);
  }
}

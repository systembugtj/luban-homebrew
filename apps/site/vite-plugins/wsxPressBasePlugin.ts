import type { Plugin } from 'vite';

const WSX_PRESS_CLIENT = '/client/';
const WSX_PRESS_DIST_CLIENT = '/dist/client.js';

/** Apply subpath rewrites to wsx-press client fetch URLs and /docs/ route parsing. */
export function transformWsxPressClient(code: string, siteBase: string): string {
  if (siteBase === '/' || siteBase === '') {
    return code;
  }

  const normalizedBase = siteBase.endsWith('/') ? siteBase.slice(0, -1) : siteBase;

  return code
    .replaceAll('"/.wsx-press/', `"${normalizedBase}/.wsx-press/`)
    .replaceAll("'/.wsx-press/", `'${normalizedBase}/.wsx-press/`)
    .replaceAll('`/docs/', `\`${normalizedBase}/docs/`)
    .replaceAll(
      'routeInfo.path.startsWith("/docs/")',
      "routeInfo.path.includes('/docs/')",
    )
    .replaceAll(
      'routeInfo.path.slice(6); // 移除 "/docs/"',
      "routeInfo.path.split('/docs/')[1] || '';",
    )
    .replaceAll(
      'routeInfo.path.slice(6); // 移除 "/docs/" 前缀',
      "routeInfo.path.split('/docs/')[1] || '';",
    )
    .replaceAll('.path.startsWith("/docs/")', ".path.includes('/docs/')")
    .replaceAll('.path.slice(6)', ".path.split('/docs/')[1] || ''");
}

function isWsxPressClientModule(id: string): boolean {
  if (!id.includes('wsx-press')) {
    return false;
  }

  return (
    id.includes(WSX_PRESS_CLIENT) ||
    id.endsWith(WSX_PRESS_DIST_CLIENT) ||
    /wsx-press\/dist\/index-[^/]+\.js$/.test(id)
  );
}

/** Rewrite wsx-press client fetch URLs at compile time (source transform, not bundle patch). */
export function wsxPressBasePlugin(siteBase: string): Plugin {
  if (siteBase === '/' || siteBase === '') {
    return { name: 'wsx-press-base-noop' };
  }

  return {
    name: 'wsx-press-base',
    enforce: 'pre',
    transform(code, id) {
      if (!isWsxPressClientModule(id)) {
        return null;
      }

      const next = transformWsxPressClient(code, siteBase);
      return next === code ? null : { code: next, map: null };
    },
  };
}

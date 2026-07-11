/** luban-homebrew tap identifiers — single source for site copy. */
export const TAP_GITHUB_USER = 'systembugtj';
export const TAP_REPO = 'luban-homebrew';
export const TAP_ID = `${TAP_GITHUB_USER}/${TAP_REPO}` as const;
export const SITE_URL = `https://${TAP_GITHUB_USER}.github.io/${TAP_REPO}`;
export const INSTALL_SCRIPT_URL = `${SITE_URL}/install.js`;
export const GITHUB_REPO_URL = `https://github.com/${TAP_GITHUB_USER}/${TAP_REPO}`;

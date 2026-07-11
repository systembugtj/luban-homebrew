/**
 * luban-homebrew site — WSX entry (GitHub Pages).
 */

import { createLogger } from '@wsxjs/wsx-core';
import 'uno.css';
import './main.css';
import '@wsxjs/wsx-base-components';
import '@wsxjs/wsx-router';
import { normalizeSitePathname } from './sitePaths';
import './i18n';
import './App.wsx';

const logger = createLogger('Luban-Site');
const THEME_STORAGE_KEY = 'luban-theme';

function initTheme(): void {
  const savedTheme = localStorage.getItem(THEME_STORAGE_KEY) || 'light';
  const theme = savedTheme === 'light' ? 'light' : 'dark';
  document.documentElement.setAttribute('data-theme', theme);
  logger.info(`Theme initialized: ${theme}`);
}

function initApp(): void {
  normalizeSitePathname();
  initTheme();

  const appContainer = document.getElementById('app');
  if (!appContainer) {
    logger.error('App container not found');
    return;
  }

  appContainer.innerHTML = '<luban-app></luban-app>';
  logger.info('luban-homebrew site initialized');
}

if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', initApp);
} else {
  initApp();
}

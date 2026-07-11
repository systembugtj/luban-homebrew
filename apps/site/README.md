# @luban-homebrew/site

Static docs site for **luban-homebrew** — Homebrew tap install guide, `install.js`, and available formulae.

Built with [WSX](https://www.wsxjs.dev) + [wsx-press](https://www.wsxjs.dev). Deploy target: **GitHub Pages** (`/luban-homebrew/` base).

## Commands

```bash
cd apps/site
pnpm dev
pnpm build
pnpm preview
```

## Content

| Path | Purpose |
|------|---------|
| `src/` | WSX pages (home, formulae, docs shell) |
| `public/docs/` | Markdown — getting started, installation, usage |
| `public/locales/` | i18next JSON (en, zh) |
| `public/install.js` | One-line Homebrew tap installer |

## Key docs

- `public/docs/guide/getting-started.md` — prerequisites and first install
- `public/docs/guide/installation.md` — install.js, brew direct, tap-first
- `public/docs/guide/usage.md` — day-to-day tap usage
- `public/docs/reference/formulas.md` — formula catalog

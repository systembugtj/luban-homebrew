---
title: Formulae
order: 1
category: reference
description: 'All formulae in systembugtj/luban-homebrew'
---

# Formulae

Packages in **`Formula/`** of [luban-homebrew](https://github.com/systembugtj/luban-homebrew).

## gopdf

| | |
|---|---|
| **Description** | Local PDF CLI — compress, analyze, OCR, MCP ([gopdf-cli](https://github.com/gopdfjs/gopdf-cli)) |
| **Status** | HEAD (builds from main until `@gopdfjs/pdf-cli` is on npm) |
| **Dependencies** | `node`, `pnpm` |

### Install

```bash
brew install --HEAD systembugtj/luban-homebrew/gopdf
```

Or via install.js:

```bash
curl -fsSL https://systembugtj.github.io/luban-homebrew/install.js | node
```

### Binaries

- `gopdf`
- `gopdf-cli` (same entry)

### Test

```bash
brew test gopdf
gopdf --help
```

### Upstream

- Repo: [gopdfjs/gopdf-cli](https://github.com/gopdfjs/gopdf-cli)
- Formula spec: [RFC 0003](https://github.com/gopdfjs/gopdf-cli/blob/main/.spec/rfc/0003-homebrew-formula.md)

---

## Adding more formulae

New `.rb` files under `Formula/` appear here when documented. See [Usage](../guide/usage) for maintainer workflow.

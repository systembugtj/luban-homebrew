---
title: Installation
order: 2
category: guide
description: 'Install formulae — install.js, direct brew, or tap-first'
---

# Installation

Three ways to install from **luban-homebrew**. All require **Homebrew**.

## 1. install.js (recommended)

Hosted at GitHub Pages — checks for `brew`, then runs `brew install`:

```bash
curl -fsSL https://www.systembug.me/luban-homebrew/install.js | node
```

Raw file in repo:

```bash
curl -fsSL https://raw.githubusercontent.com/systembugtj/luban-homebrew/main/apps/site/public/install.js | node
```

### Environment variables

| Variable | Default | Purpose |
|----------|---------|---------|
| `LUBAN_FORMULA` | `gopdf` | Formula name to install |
| `LUBAN_TAP` | `systembugtj/luban-homebrew` | Tap identifier |
| `LUBAN_HEAD` | `1` (HEAD) | Set to `0` for stable bottle install |

Examples:

```bash
# Install gopdf from HEAD (default until npm publish)
curl -fsSL https://www.systembug.me/luban-homebrew/install.js | node

# Pin stable when bottles exist
LUBAN_HEAD=0 curl -fsSL https://www.systembug.me/luban-homebrew/install.js | node

# Install a different formula (when added)
LUBAN_FORMULA=my-tool curl -fsSL https://www.systembug.me/luban-homebrew/install.js | node
```

## 2. Direct install (no tap first)

Homebrew fetches the tap automatically:

```bash
brew install --HEAD systembugtj/luban-homebrew/gopdf
```

After `@gopdfjs/pdf-cli` is on npm and bottles are published:

```bash
brew install systembugtj/luban-homebrew/gopdf
```

## 3. Tap then install

```bash
brew tap systembugtj/luban-homebrew
brew install --HEAD gopdf
```

## Brewfile

```ruby
tap "systembugtj/luban-homebrew"
brew "gopdf", args: ["HEAD"]
```

## Verify

For gopdf:

```bash
gopdf --help
which gopdf
```

## Related

- [Getting started](./getting-started)
- [Usage](./usage)
- [Formula reference](../reference/formulas)

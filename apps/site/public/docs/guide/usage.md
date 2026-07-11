---
title: Usage
order: 3
category: guide
description: 'How to use the luban-homebrew tap day to day'
---

# Usage

## Tap identifier

```
systembugtj/luban-homebrew
```

GitHub repo: [github.com/systembugtj/luban-homebrew](https://github.com/systembugtj/luban-homebrew)

## Install a formula

### One line (install.js)

```bash
curl -fsSL https://systembugtj.github.io/luban-homebrew/install.js | node
```

Defaults to **`gopdf`** with **`--HEAD`**.

### brew install patterns

```bash
# Full tap/formula path (works without prior tap)
brew install --HEAD systembugtj/luban-homebrew/gopdf

# After brew tap systembugtj/luban-homebrew
brew install --HEAD gopdf
brew install systembugtj/luban-homebrew/gopdf
```

## Upgrade

```bash
brew upgrade gopdf
brew upgrade --fetch-HEAD gopdf   # refresh HEAD builds
```

## Uninstall

```bash
brew uninstall gopdf
```

## Remove the tap

When no formulae from this tap are installed:

```bash
brew untap systembugtj/luban-homebrew
```

## List installed tap formulae

```bash
brew list --formula
brew info gopdf
```

## Add a new formula (maintainers)

1. Add `Formula/<name>.rb`
2. Test locally: `brew install --build-from-source ./Formula/<name>.rb`
3. Update README and site [formulae list](/formulas)
4. Push — CI runs `brew test-bot`

Template: `Formula/example-app.rb.example`

## Related

- [Getting started](./getting-started)
- [Installation](./installation)
- [Formula reference](../reference/formulas)

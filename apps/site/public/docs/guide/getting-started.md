---
title: Getting started
order: 1
category: guide
description: 'What luban-homebrew is and how to install your first formula'
---

# Getting started

**luban-homebrew** is a [Homebrew tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap) — a third-party repository of formulae you install with `brew`.

Tap id: **`systembugtj/luban-homebrew`**

## Prerequisites

- [Homebrew](https://brew.sh) on macOS or Linux

Check:

```bash
brew --version
```

## Install gopdf (default formula)

Pick one:

```bash
# 1. install.js (recommended)
curl -fsSL https://systembugtj.github.io/luban-homebrew/install.js | node

# 2. Direct — Homebrew auto-taps
brew install --HEAD systembugtj/luban-homebrew/gopdf

# 3. Tap first, then install
brew tap systembugtj/luban-homebrew
brew install --HEAD gopdf
```

Verify:

```bash
gopdf --help
```

Full install options: [Installation](./installation).

## Upgrade

```bash
brew upgrade gopdf
# or, if installed via tap name only:
brew upgrade systembugtj/luban-homebrew/gopdf
```

## What is available?

See the [Formulae](/formulas) page or [Formula reference](../reference/formulas).

Currently:

| Formula | Description |
|---------|-------------|
| **gopdf** | [gopdf-cli](https://github.com/gopdfjs/gopdf-cli) — local PDF CLI |

## Related

- [Installation](./installation)
- [Usage](./usage)
- [Formula reference](../reference/formulas)

---
title: FAQ
order: 1
category: faq
description: 'Common questions about luban-homebrew'
---

# FAQ

## What is luban-homebrew?

A Homebrew **tap** — third-party formulae hosted at `systembugtj/luban-homebrew`. Install with `brew install systembugtj/luban-homebrew/<formula>`.

## How do I install?

**install.js:**

```bash
curl -fsSL https://systembugtj.github.io/luban-homebrew/install.js | node
```

**brew:**

```bash
brew install --HEAD systembugtj/luban-homebrew/gopdf
```

See [Installation](../guide/installation).

## What formulae are available?

Currently **gopdf** only. Browse [/formulas](/formulas) or [Formula reference](../reference/formulas).

## Why `--HEAD` for gopdf?

`@gopdfjs/pdf-cli` is not on npm yet. The formula builds from the gopdf-cli `main` branch. After npm publish, stable `brew install systembugtj/luban-homebrew/gopdf` will work without `--HEAD`.

## Do I need Node separately?

The gopdf formula depends on Homebrew `node` and `pnpm` — they install automatically.

## Is this the same as gopdf-cli?

**gopdf-cli** is the upstream CLI project. **luban-homebrew** is the Homebrew packaging tap that installs `gopdf` on your system.

## How do I contribute a formula?

Copy `Formula/example-app.rb.example`, add your `.rb`, test with `brew install --build-from-source`, open a PR. CI runs Homebrew test-bot.

## Related

- [Getting started](../guide/getting-started)
- [Usage](../guide/usage)

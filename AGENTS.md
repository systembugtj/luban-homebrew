# AGENTS.md

Homebrew tap `systembugtj/luban-homebrew`. Formulae live in `Formula/`, casks in `Casks/`, the site in `apps/site/`.

## Submitting a pull request

1. Never push directly to `main`. Branch from an up-to-date `main`.
2. Name the branch by intent: `feat/<name>`, `fix/<name>`, or `release/<package>-<version>` for version bumps.
3. Use Conventional Commit messages, e.g. `feat: add issuegraph 1.3.1`, `fix: remove redundant Homebrew formula version`.
4. Push the branch and open a PR against `main` with `gh pr create --base main`.
5. Fill in `.github/pull_request_template.md`: package, type (Formula / Cask), upstream project, version.
6. Wait for CI. Do not merge while a check fails; fix the cause and push again.

## Package rules

- CLI tools and libraries are Formulae. macOS GUI apps are Casks.
- Source URLs point to upstream releases. Verify the `sha256` of every artifact (`curl -L <url> | shasum -a 256`).
- Do not add a redundant `version` when the URL already implies it.
- Declare build and runtime dependencies with the correct scope.
- The `test` block must run a real command.
- Formulae and casks must not require credentials, tokens or secrets.
- Review install scripts, downloaded binaries, permissions and network access.
- Avoid names that clash with homebrew-core; use a prefix if needed.

## Checks before pushing

Run locally for each changed formula:

```bash
brew audit --strict --online --formula systembugtj/luban-homebrew/<name>
brew install --build-from-source systembugtj/luban-homebrew/<name>
brew test systembugtj/luban-homebrew/<name>
```

CI (`.github/workflows/pull-request-checks.yml`) runs these required checks on PRs to `main`:

- `Homebrew formula checks`: strict audit, install and test of changed Formulae and Casks.
- `GitHub Actions security scan`: zizmor over the workflows.

## Workflow files

- Pin every action to a full commit SHA with a version comment.
- Keep `permissions` minimal (`contents: read` by default).
- The Pages deploy (`pages.yml`) is manual (`workflow_dispatch`).

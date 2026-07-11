# RFC 001: Linglong Homebrew Tap

| 属性 | 值 |
|------|-----|
| 状态 | Accepted |
| 创建日期 | 2025-03-14 |
| 作者 | - |

---

## Summary

本 RFC 约定通过自建 Homebrew 第三方 tap（仓库名 `homebrew-linglong`）托管 Linglong 相关命令行工具与应用的 formula，使用户可通过 `brew install <user>/homebrew-linglong/<formula>` 安装，并采用标准目录结构、CI 工作流与 formula 模板以保障可维护性。

---

## Context / Problem

- 需要统一、可复用的方式在 macOS/Linux 上分发 Linglong 生态下的 CLI 或二进制应用。
- 若每个应用单独提供安装脚本或手动下载，不利于版本管理、多架构支持和用户体验。
- Homebrew 是 macOS 上事实标准的包管理器，Linux 上也可用；通过官方推荐的 tap 机制可复用其生态与用户习惯。

---

## Goals

1. **单一入口**：一个 GitHub 仓库（tap）承载所有 Linglong 相关 formula。
2. **标准体验**：用户通过 `brew install` 安装，与 homebrew-core 使用方式一致。
3. **可维护**：目录与命名规范清晰，CI 做语法与测试校验，新 formula 有模板可复制。
4. **可扩展**：后续新增应用仅需在 `Formula/` 下增加 `.rb` 文件并更新文档。

---

## Proposed Solution

### 仓库与命名

- **GitHub 仓库名**：`homebrew-linglong`（`homebrew-` 前缀以支持短命令 `brew tap <user>/homebrew-linglong`）。
- **Tap 标识**：`<github_user>/homebrew-linglong`。

### 目录结构

```
.
├── .github/
│   └── workflows/
│       ├── tests.yml      # tap 语法 + formula 测试
│       └── publish.yml    # pr-pull 标签时拉取 bottles
├── Formula/
│   ├── .gitkeep
│   └── example-app.rb.example   # 新 formula 模板
├── docs/
│   └── rfc/
│       └── 001-linglong-homebrew-tap.md
├── .gitignore
└── README.md
```

- 所有 formula 仅放在 **`Formula/`** 下，扩展名为 `.rb`。
- 模板文件使用 `.rb.example` 后缀，避免被 Homebrew 加载。

### Formula 规范

- 优先从 **GitHub Releases** 下载预编译二进制，按平台/架构使用 `on_macos` / `on_linux`、`on_intel` / `on_arm` 分支。
- 每个 distribution 提供 `url` 与 `sha256`；sha256 通过 `curl -L <url> | shasum -a 256` 获取。
- 命名与 [homebrew-core](https://github.com/Homebrew/homebrew-core) 冲突时使用前缀（如 `linglong-xxx`），以便与 core 共存。

### CI

- **tests.yml**：push/PR 时在 ubuntu-22.04、macos-15-intel、macos-26 上运行 `brew test-bot --only-tap-syntax` 与 `--only-formulae`，并将 bottles 作为 artifact 上传。
- **publish.yml**：对 PR 打 `pr-pull` 标签时，执行 `brew pr-pull` 将 bottles 拉入 tap 并推送。

### 文档

- **README.md**：安装方式（直接安装 / 先 tap）、Brewfile 示例、发布到 GitHub 的步骤、添加新 formula 的步骤。
- **docs/rfc/**：本 RFC 及后续 RFC 存放于此处，命名 `NNN-short-name.md`（三位数字 + 短横线 + 简短名称）。

---

## Implementation Details

- 已落地的内容：
  - 根目录 `README.md`、`.gitignore`。
  - `Formula/.gitkeep`、`Formula/example-app.rb.example`（多平台/多架构 GitHub Release 二进制模板）。
  - `.github/workflows/tests.yml`、`.github/workflows/publish.yml`（与 `brew tap-new` 生成结构对齐）。
- 新增 formula 时：复制 `example-app.rb.example` 为 `<name>.rb`，替换 homepage、url、version、sha256、`bin.install` 等，并在 README 的「当前提供的 Formula」中登记。

---

## Alternatives Considered

| 方案 | 说明 | 未选原因 |
|------|------|----------|
| 仅提供安装脚本 | 每个应用一个 shell 脚本下载并安装 | 无版本/多架构标准化，难以与 brew upgrade 等集成 |
| 提交到 homebrew-core | 将 formula 提交到官方 core | 需满足 Acceptable Formulae 等策略，流程重；自建 tap 更灵活、可控 |
| 仅 Cask | 只做 GUI 应用的 cask | 本 tap 以 CLI/二进制为主；若后续有 GUI 需求可再增 Casks/ |

---

## Risks and Concerns

- **Formula 与 core 同名**：可能造成用户混淆或无法与 core 同装。缓解：命名加前缀（如 `linglong-*`），并在 README 中说明。
- **Bottles 构建失败**：CI 在 PR 上构建 bottle 若失败需修 formula 或依赖。缓解：本地可用 `brew install --build-from-source` 验证。
- **GitHub 仓库名变更**：若将来重命名仓库，用户需 `brew untap` 再重新 `brew tap`。建议尽量保持 `homebrew-linglong` 不变。

---

## Testing Strategy

- **语法与静态检查**：CI 中 `brew test-bot --only-tap-syntax` 确保 tap 与 formula 语法正确。
- **安装与测试块**：CI 中 `brew test-bot --only-formulae` 在矩阵环境中安装并执行各 formula 的 `test do` 块。
- **本地验证**：新增或修改 formula 后，在本地执行 `brew install --build-from-source ./Formula/<formula>.rb` 与 `brew test <formula>`。

---

## References

- [Homebrew — How to Create and Maintain a Tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
- [Homebrew — Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- 本仓库根目录 `README.md`

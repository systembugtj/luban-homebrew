# RFC 003: Karen CLI Homebrew Formula

| 属性 | 值 |
|------|-----|
| 状态 | Proposed |
| 创建日期 | 2026-10-18 |
| 关联 | [ax-karen](https://github.com/commandotj/ax-karen) |

---

## Summary

在 `systembugtj/luban-homebrew` tap 增加 Karen 命令行工具的 Homebrew formula，先通过 `--HEAD` 从 ax-karen 的 `main` 分支构建与安装。

## Context / Problem

ax-karen 已有 Rust workspace CLI：包 `karen-cli`，可执行文件 `karen`，源码位于 `apps/cli`。tap 当前没有 Karen formula。ax-karen 尚无 GitHub tag 或 release，因此目前没有可供 stable formula 使用的不可变归档与 SHA-256。

tap 已有 gopdf 的 `--HEAD` formula 范例，适合作为无正式 release 时的初始安装路径。

## Goals

- 支持 `brew install --HEAD systembugtj/luban-homebrew/karen`。
- 从 ax-karen 的 `main` 源码构建 `karen` CLI，并安装到 Homebrew `bin`。
- 通过 formula 测试验证 `karen --help` 可运行。
- 记录 `--HEAD` 是滚动源码安装，要求本机安装 Rust 构建工具链。

## Non-goals

- 安装 Karen 桌面应用或创建 Homebrew cask。
- 发布或伪造 stable 版本 URL、版本号及 SHA-256。
- 修改 ax-karen release workflow 或自动更新 tap 的逻辑。

## Proposed Solution

新增 `Formula/karen.rb`。Formula 使用 ax-karen GitHub 仓库的 `main` 分支作为 `head` 来源，声明 `rust` 为 build dependency，以 `cargo install --path apps/cli --root prefix` 构建并安装 CLI。formula 的测试运行 `karen --help` 并检查输出包含 `Karen`。

README 的 formula 清单加入 Karen，并明确展示 `--HEAD` 安装命令。正式 release、不可变资产和校验和准备好后，再通过独立变更加入 stable 版本支持；桌面应用 cask 另行评估。

## Alternatives Considered

| 方案 | 说明 | 未选原因 |
|------|------|----------|
| 立即添加 stable formula | 使用 GitHub Release 归档和 SHA-256 | ax-karen 尚无 tag 或 release，资产与校验和不存在 |
| 现在添加桌面 cask | 分发 Karen.app | tap 目前只有 Formula 目录，且 ax-karen 尚无可安装的已发布应用资产 |
| 仅添加 `--HEAD` CLI formula | 从 main 构建 `karen` 可执行文件 | 选定方案；可立即验证，不编造发布元数据 |

## Acceptance

- `Formula/karen.rb` 只提供 `--HEAD` 安装，不包含占位 URL 或 SHA-256。
- Homebrew tap syntax 检查通过。
- 在支持的 macOS 和 Linux 环境，formula 构建并安装 `karen`，`brew test karen` 通过。
- README 将 Karen 列入 formula 清单并给出准确安装命令。

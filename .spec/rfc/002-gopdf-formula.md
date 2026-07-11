# RFC 002: gopdf Homebrew Formula

| 属性 | 值 |
|------|-----|
| 状态 | Proposed |
| 创建日期 | 2026-07-11 |
| 关联 | [gopdf-cli RFC 0003](https://github.com/gopdfjs/gopdf-cli/blob/main/.spec/rfc/0003-homebrew-formula.md) |

---

## Summary

在 **luban-homebrew** tap（`systembugtj/luban-homebrew`）提供 `gopdf` formula，使用户可通过 Homebrew 安装 [gopdf-cli](https://github.com/gopdfjs/gopdf-cli)。

## Install

```bash
# npm 发布前 — 从 main 构建
brew install --HEAD systembugtj/luban-homebrew/gopdf

# npm 发布后 — 稳定版（formula 切换为 npm tarball）
brew install systembugtj/luban-homebrew/gopdf
```

## Formula 位置

`Formula/gopdf.rb`

## 迁移到 stable（npm）

1. 发布 `@gopdfjs/pdf-cli@VERSION` 到 npm
2. 计算 tarball sha256：`curl -L "https://registry.npmjs.org/@gopdfjs/pdf-cli/-/pdf-cli-VERSION.tgz" | shasum -a 256`
3. 将 `gopdf.rb` 改为 npm `url` + `std_npm_args` 安装（见 formula 文件顶部注释）
4. 移除或保留 `head` 供开发使用

## Related

- gopdf-cli [RFC 0002 install.js](https://github.com/gopdfjs/gopdf-cli/blob/main/.spec/rfc/0002-install-script.md)
- [001-linglong-homebrew-tap.md](./001-linglong-homebrew-tap.md)

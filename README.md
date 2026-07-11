# Linglong Homebrew Tap

本仓库为 Homebrew 第三方 tap，用于托管 Linglong 相关命令行工具与应用的 formula。

## 前置要求

- [Homebrew](https://brew.sh)（macOS 或 Linux）

## 使用方式

### 方式一：直接安装（推荐）

不先 tap，直接安装指定 formula，Homebrew 会自动添加本 tap：

```bash
brew install <YOUR_GITHUB_USER>/luban-homebrew/<formula>
```

例如（将 `YOUR_GITHUB_USER` 换成你的 GitHub 用户名）：

```bash
brew install YOUR_GITHUB_USER/luban-homebrew/my-app
```

### 方式二：先 tap 再安装

```bash
# 添加 tap（仓库名 luban-homebrew）
brew tap YOUR_GITHUB_USER/luban-homebrew

# 安装 formula
brew install <formula>
# 或明确指定 tap 下的 formula，避免与 homebrew-core 同名冲突
brew install YOUR_GITHUB_USER/luban-homebrew/<formula>
```

### 在 Brewfile 中使用

```ruby
tap "YOUR_GITHUB_USER/luban-homebrew"
brew "<formula>"
```

## 当前提供的 Formula

（在 `Formula/` 目录下添加 `.rb` 文件后，在此列出每个 formula 的简短说明。）

| Formula | 说明 |
|---------|------|
| **gopdf** | [gopdf-cli](https://github.com/gopdfjs/gopdf-cli) — 本地 PDF CLI（压缩、分析、OCR、MCP）。npm 发布前：`brew install --HEAD systembugtj/luban-homebrew/gopdf` |

## 发布到 GitHub

1. 在 GitHub 上创建仓库，名称 **`luban-homebrew`**（tap：`brew tap user/luban-homebrew`）。
2. 将本仓库与远程关联并推送：

   ```bash
   git remote add origin https://github.com/YOUR_GITHUB_USER/luban-homebrew.git
   git push -u origin main
   ```

3. 使用 GitHub CLI 一键创建并推送（需已安装 `brew install gh`）：

   ```bash
   gh repo create YOUR_GITHUB_USER/luban-homebrew --push --public --source .
   ```

## 添加新的 Formula

- 将 formula 的 Ruby 文件放在 **`Formula/`** 目录下，扩展名为 `.rb`。
- 可参考 **`Formula/example-app.rb.example`**：复制为 `你的应用名.rb`，替换 `url`、`version`、`sha256` 和 `bin.install` 中的二进制名。计算 sha256：`curl -L <url> | shasum -a 256`。
- 命名避免与 [homebrew-core](https://github.com/Homebrew/homebrew-core) 冲突时，可使用带前缀的名字（例如 `linglong-xxx`）。
- 本地测试：

  ```bash
  brew install --build-from-source ./Formula/<formula>.rb
  # 或 tap 后
  brew install YOUR_GITHUB_USER/luban-homebrew/<formula>
  ```

更多说明见 [Homebrew — How to Create and Maintain a Tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)。

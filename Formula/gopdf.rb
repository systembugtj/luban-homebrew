# typed: false
# frozen_string_literal: true

# gopdf CLI — https://github.com/gopdfjs/gopdf-cli
# Spec: gopdf-cli/.spec/rfc/0003-homebrew-formula.md
#
# Stable (after @gopdfjs/pdf-cli is on npm):
#   url "https://registry.npmjs.org/@gopdfjs/pdf-cli/-/pdf-cli-0.1.0.tgz"
#   sha256 from: curl -L <url> | shasum -a 256
#   system "npm", "install", *std_npm_args
#   bin.install_symlink libexec.glob("bin/*")
#
# Until npm publish, install from main:
#   brew install --HEAD systembugtj/luban-homebrew/gopdf

class Gopdf < Formula
  desc "Local PDF CLI — compress, analyze, OCR (gopdf-cli)"
  homepage "https://github.com/gopdfjs/gopdf-cli"
  license "MIT"
  head "https://github.com/gopdfjs/gopdf-cli.git", branch: "main"

  depends_on "node"
  depends_on "pnpm" => :build

  def install
    # pnpm deploy needs a writable HOME during the build.
    ENV["HOME"] = buildpath

    system "pnpm", "install", "--frozen-lockfile"
    system "pnpm", "--filter", "@gopdfjs/pdf-cli", "run", "build"
    # site is not needed for CLI; deploy otherwise resolves apps/site deps.
    rm_rf "apps/site"
    system "pnpm", "--filter", "@gopdfjs/pdf-cli", "deploy", "--legacy", "--prod", libexec

    write_wrapper "gopdf"
    write_wrapper "gopdf-cli"
  end

  def write_wrapper(name)
    (bin/name).write <<~SHELL
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/index.mjs" "$@"
    SHELL
  end

  test do
    output = shell_output("#{bin}/gopdf --help")
    assert_match "gopdf", output
  end
end

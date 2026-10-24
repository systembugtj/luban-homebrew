# typed: false
# frozen_string_literal: true

class Reasongraph < Formula
  desc "Repository decision history CLI for coding agents"
  homepage "https://github.com/borg0ai/dx-reasongraph"
  url "https://github.com/borg0ai/dx-reasongraph/releases/download/v0.2.2/borg0ai-reasongraph-0.2.2.tgz"
  sha256 "a932cce4a5c7eb61b8565ce038d2cb42cc17ca662440f7558fae6a501bda4886"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/reasongraph --version")
  end
end

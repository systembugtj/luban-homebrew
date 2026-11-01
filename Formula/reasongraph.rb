# typed: false
# frozen_string_literal: true

class Reasongraph < Formula
  desc "Repository decision history CLI for coding agents"
  homepage "https://github.com/borg0ai/dx-reasongraph"
  url "https://github.com/borg0ai/dx-reasongraph/releases/download/v0.2.6/borg0ai-reasongraph-0.2.6.tgz"
  sha256 "7358d259356a1cdadaeb731b637cf70be761d1f700e6b70befa5a7f376d32805"
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

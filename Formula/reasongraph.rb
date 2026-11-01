# typed: false
# frozen_string_literal: true

class Reasongraph < Formula
  desc "Repository decision history CLI for coding agents"
  homepage "https://github.com/borg0ai/dx-reasongraph"
  url "https://github.com/borg0ai/dx-reasongraph/releases/download/v0.2.5/borg0ai-reasongraph-0.2.5.tgz"
  sha256 "63e446d7a8c05131d7f67d30d5fd86c658136b1522cf48f229a9b4edcb92078b"
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

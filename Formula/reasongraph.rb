# typed: false
# frozen_string_literal: true

class Reasongraph < Formula
  desc "Repository decision history CLI for coding agents"
  homepage "https://github.com/borg0ai/dx-reasongraph"
  url "https://github.com/borg0ai/dx-reasongraph/releases/download/v0.2.3/borg0ai-reasongraph-0.2.3.tgz"
  sha256 "c487210e3b4c5ce7ece96b8819eb050bcb8a50c73fc59746884af416633c6fa6"
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

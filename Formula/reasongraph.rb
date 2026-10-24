# typed: false
# frozen_string_literal: true

class Reasongraph < Formula
  desc "Repository decision history CLI for coding agents"
  homepage "https://github.com/borg0ai/dx-reasongraph"
  url "https://github.com/borg0ai/dx-reasongraph/releases/download/v0.2.4/borg0ai-reasongraph-0.2.4.tgz"
  sha256 "d57054d164a915a0e3d4e6ad6c1bd8984e7bfaf53f7684da85572912243921a1"
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

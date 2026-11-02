# typed: false
# frozen_string_literal: true

class Issuegraph < Formula
  desc "Git-tracked issue graph CLI for coding agents"
  homepage "https://github.com/borg0ai/dx-issuegraph"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/borg0ai/dx-issuegraph/releases/download/v1.3.3/issuegraph_1.3.3_darwin-arm64.tar.gz"
      sha256 "bf2b71cda66cb3c0344f02c31202463458d878a674b135398543e36551b8f5f4"
    end
    on_intel do
      url "https://github.com/borg0ai/dx-issuegraph/releases/download/v1.3.3/issuegraph_1.3.3_darwin-amd64.tar.gz"
      sha256 "3b7e74c066885a0ac425ccd823d4402d0ebf5e099c1ebd72893c81d5e85c1400"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/borg0ai/dx-issuegraph/releases/download/v1.3.3/issuegraph_1.3.3_linux-arm64.tar.gz"
      sha256 "c9c96a1d90300f778df720e11c137242d3f41f2fe405865c2174068298f8c7dc"
    end
    on_intel do
      url "https://github.com/borg0ai/dx-issuegraph/releases/download/v1.3.3/issuegraph_1.3.3_linux-amd64.tar.gz"
      sha256 "6f049575fc547e265e036f539bef00a6261ae70f62584b403da9ece3efc7aaa2"
    end
  end

  def install
    bin.install "issuegraph"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/issuegraph --version")
  end
end

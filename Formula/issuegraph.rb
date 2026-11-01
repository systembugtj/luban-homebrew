# typed: false
# frozen_string_literal: true

class Issuegraph < Formula
  desc "Git-tracked issue graph CLI for coding agents"
  homepage "https://github.com/borg0ai/dx-issuegraph"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/borg0ai/dx-issuegraph/releases/download/v1.3.2/issuegraph_1.3.2_darwin-arm64.tar.gz"
      sha256 "fe30d373def8e81f558f1b55ef4ce30b0f2789321fbd76ae8676a3661fd00dca"
    end
    on_intel do
      url "https://github.com/borg0ai/dx-issuegraph/releases/download/v1.3.2/issuegraph_1.3.2_darwin-amd64.tar.gz"
      sha256 "7e4fbb039ec2f3b764c337f84dd72af5ce2d7a93547926d85fc395e0367eeca3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/borg0ai/dx-issuegraph/releases/download/v1.3.2/issuegraph_1.3.2_linux-arm64.tar.gz"
      sha256 "ebae073743ad4dd7c4b45990a14e1d3356576bdd7f109c3a898a82661f6fa14d"
    end
    on_intel do
      url "https://github.com/borg0ai/dx-issuegraph/releases/download/v1.3.2/issuegraph_1.3.2_linux-amd64.tar.gz"
      sha256 "e9ccbb39abf7c319a6e25e6adaba88ea81144114205a2ce333adcba43071ae4f"
    end
  end

  def install
    bin.install "issuegraph"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/issuegraph --version")
  end
end

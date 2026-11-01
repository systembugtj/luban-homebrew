# typed: false
# frozen_string_literal: true

class Issuegraph < Formula
  desc "Git-tracked issue graph CLI for coding agents"
  homepage "https://github.com/borg0ai/dx-issuegraph"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/borg0ai/dx-issuegraph/releases/download/v1.3.1/issuegraph_1.3.1_darwin-arm64.tar.gz"
      sha256 "e7b3ef8586d7b8b58850bc411f172c73c4ea9ea9a20dfe087b4fc39f70ebd5f1"
    end
    on_intel do
      url "https://github.com/borg0ai/dx-issuegraph/releases/download/v1.3.1/issuegraph_1.3.1_darwin-amd64.tar.gz"
      sha256 "a5bd9a91dfbe39aff0ca60f450de41bc4aed338f3b8f6133f4fe5352bdef969f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/borg0ai/dx-issuegraph/releases/download/v1.3.1/issuegraph_1.3.1_linux-arm64.tar.gz"
      sha256 "34d7ee384bc5160d8b4a130f639f38bcd00a7b6902d288e90a78e573c442a928"
    end
    on_intel do
      url "https://github.com/borg0ai/dx-issuegraph/releases/download/v1.3.1/issuegraph_1.3.1_linux-amd64.tar.gz"
      sha256 "c1fac419b86648adc088e6b1f92cebe3596b47af36b748ea3bb7bf6b61d52fe7"
    end
  end

  def install
    bin.install "issuegraph"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/issuegraph --version")
  end
end

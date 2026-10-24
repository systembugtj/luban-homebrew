cask "karen" do
  version "0.14.0"
  sha256 "fe44f10c5651bef83eaa0b9cd80943657b975f3a6d1b723401807ce909afa3c6"

  url "https://github.com/commandotj/ax-karen/releases/download/v0.14.0/Karen_0.14.0_aarch64.dmg"
  name "Karen"
  desc "System monitor and disk-space explorer"
  homepage "https://github.com/commandotj/ax-karen"

  depends_on arch: :arm64

  app "Karen.app"
end

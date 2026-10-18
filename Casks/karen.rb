cask "karen" do
  version "0.12.0"
  # PLACEHOLDER: replace with the real sha256 from the release's SHA256SUMS
  # before merging; the v0.11.0 release run is still publishing assets.
  sha256 "a4ee4dc507ee076b5663732c99e20d015745a6920dd0594291b378136c452da5"

  url "https://github.com/commandotj/ax-karen/releases/download/v#{version}/karen-desktop-#{version}-aarch64-apple-darwin.tar.gz"
  name "Karen"
  desc "System monitor and disk-space explorer"
  homepage "https://github.com/commandotj/ax-karen"

  app "macos/Karen.app"
end

cask "karen" do
  version "0.13.0"
  # PLACEHOLDER: replace with the real sha256 from the release's SHA256SUMS
  # before merging; the v0.11.0 release run is still publishing assets.
  sha256 "b08c26b36ba2bd690cc0ed5ce8a329df730c37e11eb01d5d0b91afe8e0b4f312"

  url "https://github.com/commandotj/ax-karen/releases/download/v0.13.0/Karen_0.13.0_aarch64.dmg"
  name "Karen"
  desc "System monitor and disk-space explorer"
  homepage "https://github.com/commandotj/ax-karen"

  depends_on arch: :arm64

  app "Karen.app"
end

cask "karen" do
  version "0.12.0"
  sha256 "f7d338d2e6dd705f3f519695221b0346ebf5ec5d40d2ed15debdff923365c5f8"

  url "https://github.com/commandotj/ax-karen/releases/download/v#{version}/Karen_#{version}_aarch64.dmg"
  name "Karen"
  desc "System monitor and disk-space explorer"
  homepage "https://github.com/commandotj/ax-karen"

  depends_on macos: ">= :high_sierra"
  depends_on arch: :arm64

  app "Karen.app"
end

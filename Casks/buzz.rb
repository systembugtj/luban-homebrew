cask "buzz" do
  version "0.6.2"

  on_arm do
    url "https://github.com/commandotj/ax-buzz/releases/download/v#{version}/Buzz-v#{version}-macos-arm64.dmg"
    # Seed placeholder: replace with SHA-256 from the published Buzz release before merging.
    sha256 "PLACEHOLDER_UPDATE_BEFORE_MERGE"
  end

  on_intel do
    url "https://github.com/commandotj/ax-buzz/releases/download/v#{version}/Buzz-v#{version}-macos-amd64.dmg"
    # Seed placeholder: replace with SHA-256 from the published Buzz release before merging.
    sha256 "PLACEHOLDER_UPDATE_BEFORE_MERGE"
  end

  name "Buzz"
  desc "Native macOS app for managing Homebrew packages"
  homepage "https://github.com/commandotj/ax-buzz"

  app "Buzz.app"
end

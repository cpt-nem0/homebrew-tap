cask "verse" do
  version "2.0.4"
  sha256 "deea9c2ab20cebe8a879c3722b171f012c67a89205aa8afc7f1003626640c5ff"

  url "https://github.com/cpt-nem0/verse/releases/download/v#{version}/Verse.zip",
      verified: "github.com/cpt-nem0/verse/"
  name "Verse"
  desc "Time-synced lyrics in a floating, draggable glass pill"
  homepage "https://cpt-nem0.github.io/verse/"

  depends_on macos: :sonoma

  app "Verse.app"

  caveats <<~EOS
    Verse is ad-hoc signed, not notarized by Apple. If macOS Gatekeeper
    blocks it with "Verse is damaged and can't be opened", clear the
    quarantine flag:
      xattr -cr /Applications/Verse.app

    Or install with quarantine skipped from the start:
      brew install --cask --no-quarantine verse
  EOS
end

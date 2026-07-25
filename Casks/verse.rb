cask "verse" do
  version "2.0.3"
  sha256 "c155a6eb35861f3846049f16975a810929796ddfec7e4e11140e2ee370d6f1eb"

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

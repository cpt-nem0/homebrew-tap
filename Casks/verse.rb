cask "verse" do
  version "2.0.4"
  sha256 "deea9c2ab20cebe8a879c3722b171f012c67a89205aa8afc7f1003626640c5ff"

  url "https://github.com/cpt-nem0/verse/releases/download/v#{version}/Verse.zip",
      verified: "github.com/cpt-nem0/verse/"
  name "Verse"
  desc "Time-synced lyrics in a floating, draggable glass pill"
  homepage "https://verse.3am.quest/"

  depends_on macos: :sonoma

  app "Verse.app"

  # Verse is ad-hoc signed, not notarized. Homebrew quarantines cask
  # downloads, which would make Gatekeeper refuse to launch the app, so
  # clear the flag after install. Delete this block if you'd rather vet
  # the binary and clear it yourself.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Verse.app"]
  end

  caveats <<~EOS
    Verse launches with no Gatekeeper prompt — the install clears the
    quarantine flag automatically (the app is ad-hoc signed, not notarized).
  EOS
end

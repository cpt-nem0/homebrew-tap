cask "verse" do
  version "2.1.0"
  sha256 "db2fcc124ff0449fcd8f4ac12c44f4dd3365395d87361aaa146b8093ec499510"

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
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-cr", "{{appdir}}/Verse.app"],
        writable_paths: ["Verse.app"],
        writable_base:  :appdir
  end

  caveats <<~EOS
    Verse launches with no Gatekeeper prompt — the install clears the
    quarantine flag automatically (the app is ad-hoc signed, not notarized).
  EOS
end

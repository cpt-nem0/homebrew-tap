cask "plate" do
  version "2.0.0"
  sha256 "5693c53189626eca6fe886af355b0fd3c5901cf10cc52bf1c569ece4419dd00f"

  url "https://github.com/cpt-nem0/plate/releases/download/v#{version}/Plate.zip",
      verified: "github.com/cpt-nem0/plate/"
  name "Plate"
  desc "Menu bar task capture — catches every task before it slips away"
  homepage "https://cpt-nem0.github.io/plate/"

  depends_on macos: :sonoma

  app "Plate.app"

  caveats <<~EOS
    Plate is ad-hoc signed, not notarized by Apple. If macOS Gatekeeper
    blocks it with "Plate is damaged and can't be opened", clear the
    quarantine flag:
      xattr -cr /Applications/Plate.app

    Or install with quarantine skipped from the start:
      brew install --cask --no-quarantine plate
  EOS
end

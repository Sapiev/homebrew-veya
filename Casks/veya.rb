cask "veya" do
  version "1.1.0"
  sha256 "a4792be1ef859da47790e4af235d0c6eca6cdddee2d925aeb4cc8e26123a1482"

  url "https://github.com/Sapiev/Veya/releases/download/v#{version}/Veya-#{version}.dmg"
  name "Veya"
  desc "Native Spotify client"
  homepage "https://github.com/Sapiev/Veya"

  livecheck do
    url "https://sapiev.github.io/Veya/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Veya.app"

  zap trash: [
    "~/Library/Application Scripts/org.veya.Veya",
    "~/Library/Containers/org.veya.Veya",
  ]

  caveats <<~EOS
    Veya is not notarized by Apple. On first launch macOS blocks it; allow it once in
    System Settings > Privacy & Security > Open Anyway, or run:
      xattr -dr com.apple.quarantine /Applications/Veya.app
    Later versions update in the app and do not ask again.
  EOS
end

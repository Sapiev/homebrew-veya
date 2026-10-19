cask "veya" do
  version "1.0.0"
  sha256 "f575eddebfce4888019a431bf775ab105ad8ac979cff26457168a3ece9040d1f"

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

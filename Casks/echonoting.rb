cask "echonoting" do
  version "0.2.7"
  arch arm: "aarch64", intel: "x64"

  on_arm do
    sha256 "a6f7a22e1246d55e9a779e720fb69ba24beb00de8f67cbdd5331717986a64e8d"
    url "https://github.com/AimeurAmin/echonoting-releases/releases/download/desktop-v#{version}/EchoNoting_0.2.7_aarch64.dmg"
  end

  on_intel do
    sha256 "917a604763c1f468e275a2c6c23cf697c1dd39bc29bb8111f9e112d2a22b55e9"
    url "https://github.com/AimeurAmin/echonoting-releases/releases/download/desktop-v#{version}/EchoNoting_0.2.7_x64.dmg"
  end

  name "EchoNoting"
  desc "AI meeting notes with live transcription"
  homepage "https://github.com/AimeurAmin/echonoting-releases"

  app "EchoNoting.app"

  # Clear the macOS quarantine attribute after install so Gatekeeper doesn't
  # block the unsigned app with a "damaged" error. Once we ship Apple-notarized
  # builds, this postflight should be removed.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/EchoNoting.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.echonoting.desktop",
    "~/Library/Caches/com.echonoting.desktop",
    "~/Library/Preferences/com.echonoting.desktop.plist",
    "~/Library/WebKit/com.echonoting.desktop",
    "~/Library/HTTPStorages/com.echonoting.desktop",
  ]
end

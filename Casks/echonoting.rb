cask "echonoting" do
  version "0.4.0"
  arch arm: "aarch64", intel: "x64"

  on_arm do
    sha256 "38cb3947e0f5d18f076a64aea7c7130de543e21eae33ce91875459a78fd9923e"
    url "https://github.com/AimeurAmin/echonoting-releases/releases/download/desktop-v#{version}/EchoNoting_0.4.0_aarch64.dmg"
  end

  on_intel do
    sha256 "dbbabf825227e43bdadee75f6bad86f1c4bdd249efafe25e952d0ccebe906aa9"
    url "https://github.com/AimeurAmin/echonoting-releases/releases/download/desktop-v#{version}/EchoNoting_0.4.0_x64.dmg"
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

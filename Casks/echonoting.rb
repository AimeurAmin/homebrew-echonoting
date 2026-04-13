cask "echonoting" do
  version "0.3.2"
  arch arm: "aarch64", intel: "x64"

  on_arm do
    sha256 "9d8646bee5c11c6c635c58301437fe9c8f6d1ffa43e5ebf93b52b37a195eae16"
    url "https://github.com/AimeurAmin/echonoting-releases/releases/download/desktop-v#{version}/EchoNoting_0.3.2_aarch64.dmg"
  end

  on_intel do
    sha256 "f8f2fba6799c55c6d41f8446ad26af325bb809e1402670a42994ffd7d9462118"
    url "https://github.com/AimeurAmin/echonoting-releases/releases/download/desktop-v#{version}/EchoNoting_0.3.2_x64.dmg"
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

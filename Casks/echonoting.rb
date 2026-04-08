cask "echonoting" do
  version "0.2.5"
  arch arm: "aarch64", intel: "x64"

  on_arm do
    sha256 "1675068b729eed6436fcfeea831c6fbec9b090853773d490a62a9daa2c4f5185"
    url "https://github.com/AimeurAmin/echonoting-releases/releases/download/desktop-v#{version}/EchoNoting_0.2.5_aarch64.dmg"
  end

  on_intel do
    sha256 "72ddf0dfd6fa2ee8f9630e6817c549eaa8d853a41dd2b667021592f247695b50"
    url "https://github.com/AimeurAmin/echonoting-releases/releases/download/desktop-v#{version}/EchoNoting_0.2.5_x64.dmg"
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

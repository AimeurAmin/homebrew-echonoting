cask "echonoting" do
  version "0.3.0"
  arch arm: "aarch64", intel: "x64"

  on_arm do
    sha256 "9045f3c6a5fa6f7dd339d5a905bf13ae33d7afb467149bfc112b3e1c6258823b"
    url "https://github.com/AimeurAmin/echonoting-releases/releases/download/desktop-v#{version}/EchoNoting_0.3.0_aarch64.dmg"
  end

  on_intel do
    sha256 "e4c77f61325694afe75bc426aec60fac6df2299c84024e03d863ebe064b34ae8"
    url "https://github.com/AimeurAmin/echonoting-releases/releases/download/desktop-v#{version}/EchoNoting_0.3.0_x64.dmg"
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

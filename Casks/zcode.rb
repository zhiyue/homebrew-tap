# frozen_string_literal: true

cask "zcode" do
  version "3.2.2"

  on_arm do
    url "https://cdn-zcode.z.ai/zcode/electron/releases/#{version}/ZCode-#{version}-mac-arm64.dmg"
    sha256 "eaa2bdd5de79421706e191868917477c6cdcad5677d75824fbfcc57f7161c629"
  end

  on_intel do
    url "https://cdn-zcode.z.ai/zcode/electron/releases/#{version}/ZCode-#{version}-mac-x64.dmg"
    sha256 "160c6492293051f0aa3d67b5a05a376ff0adb89cd925f8b6f6bcc2125e6c5a28"
  end

  name "ZCode"
  desc "AI-powered coding assistant with multi-agent collaboration"
  homepage "https://zcode.z.ai/cn"

  livecheck do
    url "https://cdn-zcode.z.ai/zcode/electron/releases/latest/latest-mac.yml"
    strategy :electron_builder
  end

  app "ZCode.app"

  zap trash: [
    "~/Library/Application Support/ZCode",
    "~/Library/Caches/ZCode",
    "~/Library/Preferences/com.zcode.desktop.plist",
    "~/Library/Saved Application State/com.zcode.desktop.savedState",
  ]
end

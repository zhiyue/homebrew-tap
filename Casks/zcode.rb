# frozen_string_literal: true

cask "zcode" do
  version "3.1.4"

  on_arm do
    url "https://cdn-zcode.z.ai/zcode/electron/releases/#{version}/ZCode-#{version}-mac-arm64.dmg"
    sha256 "71d683b8fbaa62d3efb243161dc4d9f899d445a78bf95dd071d809f2c7467f9d"
  end

  on_intel do
    url "https://cdn-zcode.z.ai/zcode/electron/releases/#{version}/ZCode-#{version}-mac-x64.dmg"
    sha256 "08149cab589c36c15b7bea1efe707acf60a3a1127fa27df4d3d7ab1cb166fa60"
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

# frozen_string_literal: true

cask "zcode" do
  version "3.1.8"

  on_arm do
    url "https://cdn-zcode.z.ai/zcode/electron/releases/#{version}/ZCode-#{version}-mac-arm64.dmg"
    sha256 "0f0d5c3b3156322605f930e088327090079d4ce60f790040fa543caba55f36a9"
  end

  on_intel do
    url "https://cdn-zcode.z.ai/zcode/electron/releases/#{version}/ZCode-#{version}-mac-x64.dmg"
    sha256 "38d9eaaa61f902689406da845cff5df69a543e9cfb7620c91a74e71d55510154"
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

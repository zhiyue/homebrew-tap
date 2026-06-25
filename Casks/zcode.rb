# frozen_string_literal: true

cask "zcode" do
  version "3.1.6"

  on_arm do
    url "https://cdn-zcode.z.ai/zcode/electron/releases/#{version}/ZCode-#{version}-mac-arm64.dmg"
    sha256 "1c1192efedc83b823610d06909d99fce8bcfae6ca021e996eedb4b4419f48174"
  end

  on_intel do
    url "https://cdn-zcode.z.ai/zcode/electron/releases/#{version}/ZCode-#{version}-mac-x64.dmg"
    sha256 "bef52bbc929e6640eb1cbac490f27cbfc91d540e0f4fbb02db0a5b58bfe8a94c"
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

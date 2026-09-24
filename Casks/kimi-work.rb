# frozen_string_literal: true

cask "kimi-work" do
  version "3.2.14"

  url "https://kimi-img.moonshot.cn/app/download/mac/kimi_#{version}.dmg"
  sha256 "3284006251410d93581e9e5ed0af71b25ed15ee1f3139f87d4f1ef854b9bbafc"

  name "Kimi"
  desc "AI-powered work assistant by Moonshot AI"
  homepage "https://www.kimi.com/zh-cn/products/kimi-work"

  depends_on arch: :arm64

  livecheck do
    url "https://appsupport.moonshot.cn/api/app/pkg/latest/macos/download"
    strategy :header_match
  end

  app "Kimi.app"

  zap trash: [
    "~/Library/Application Support/Kimi",
    "~/Library/Caches/com.moonshot.kimichat",
    "~/Library/Caches/com.moonshot.kimichat.ShipIt",
    "~/Library/Preferences/com.moonshot.kimichat.plist",
    "~/Library/Saved Application State/com.moonshot.kimichat.savedState",
  ]
end

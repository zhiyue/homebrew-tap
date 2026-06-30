# frozen_string_literal: true

cask "zcode" do
  version "3.2.1"

  on_arm do
    url "https://cdn-zcode.z.ai/zcode/electron/releases/#{version}/ZCode-#{version}-mac-arm64.dmg"
    sha256 "1a7c47032174d82d1aca81658f12de3fdcd14cbd389b74d578dca06d7fbe4a01"
  end

  on_intel do
    url "https://cdn-zcode.z.ai/zcode/electron/releases/#{version}/ZCode-#{version}-mac-x64.dmg"
    sha256 "1f8e0719508f3cda1df6b50a157339f9bcf3906d12df928ba36dbcdd375aaffe"
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

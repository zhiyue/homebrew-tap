# frozen_string_literal: true

cask "zcode" do
  version "3.1.1"

  on_arm do
    url "https://cdn.zcode-ai.com/zcode/electron/releases/#{version}/ZCode-#{version}-mac-arm64.dmg"
    sha256 "197a9f25854ead4dcb7ec9d54d83e4f386371c7ff11a2fdeb7c1c3996ba965a5"
  end

  on_intel do
    url "https://cdn.zcode-ai.com/zcode/electron/releases/#{version}/ZCode-#{version}-mac-x64.dmg"
    sha256 "a65ad12c630045d09db19c8c4aedbcfeeb2b0c6c868aa6d01a4a08fb540b64c4"
  end

  name "ZCode"
  desc "AI-powered coding assistant with multi-agent collaboration"
  homepage "https://zcode.z.ai/cn"

  livecheck do
    url "https://zcode.z.ai/cn"
    regex(/ZCode[- ]v?(\d+(?:\.\d+)+)/i)
  end

  app "ZCode.app"

  zap trash: [
    "~/Library/Application Support/ZCode",
    "~/Library/Caches/ZCode",
    "~/Library/Preferences/com.zcode.desktop.plist",
    "~/Library/Saved Application State/com.zcode.desktop.savedState",
  ]
end

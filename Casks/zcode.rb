# frozen_string_literal: true

cask "zcode" do
  version "3.1.2"

  on_arm do
    url "https://cdn.zcode-ai.com/zcode/electron/releases/#{version}/ZCode-#{version}-mac-arm64.dmg"
    sha256 "80c5b4cc211f5ab5e1eeb7d8e1822e4743df93afbfbbacf073af94d35f2bcbcb"
  end

  on_intel do
    url "https://cdn.zcode-ai.com/zcode/electron/releases/#{version}/ZCode-#{version}-mac-x64.dmg"
    sha256 "3068dd0487cafc6711b94d123b67a40aca384c5c27c83e9223b8c37b20fbadf4"
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

# frozen_string_literal: true

# tgcli from zhiyue/tgcli — our own fork, which adds inline-keyboard support
# (`messages buttons` / `click` / `latest`) on top of dgrr/tgcli.
#
# `version` + all four sha256 are kept current automatically by
# .github/workflows/bump-tgcli.yml (checks zhiyue/tgcli daily, recomputes the
# checksums from the release assets, commits). Manual edits get overwritten.

class Tgcli < Formula
  desc "Telegram CLI tool using grammers (pure Rust MTProto)"
  homepage "https://github.com/zhiyue/tgcli"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zhiyue/tgcli/releases/download/v#{version}/tgcli-darwin-arm64"
      sha256 "650444209dd8fd9becc7f374d68a7be65c9ed4ec42c43a57c2960cd113819937"
    end
    on_intel do
      url "https://github.com/zhiyue/tgcli/releases/download/v#{version}/tgcli-darwin-amd64"
      sha256 "9b26cf45e94c689dd825eebd40888e6306bdce3afe72b1028cfc77d7c20ee933"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zhiyue/tgcli/releases/download/v#{version}/tgcli-linux-arm64"
      sha256 "e438e9dae491132fe23b94f8ddc3eef6c1ec51fb00a0d1b4c333c2c21a7e30c9"
    end
    on_intel do
      url "https://github.com/zhiyue/tgcli/releases/download/v#{version}/tgcli-linux-amd64"
      sha256 "54c790ea6300b62336ffcd664de926f9a5dd684ccaeb7c21203aaf065c9b2b51"
    end
  end

  def install
    binary = Dir["tgcli-*"].first || "tgcli"
    bin.install binary => "tgcli"
  end

  test do
    assert_match "tgcli", shell_output("#{bin}/tgcli --version")
  end
end

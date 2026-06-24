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
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/zhiyue/tgcli/releases/download/v#{version}/tgcli-darwin-arm64"
      sha256 "32e882b847d3320142a4c7594ee0047e5ff4fed38ab2bbdaa54c53f9ec2f2c9e"
    end
    on_intel do
      url "https://github.com/zhiyue/tgcli/releases/download/v#{version}/tgcli-darwin-amd64"
      sha256 "3b99d05c54eb59795aab81ae8bffcd582599435c70c7835c33d94a6e9a1ef2f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zhiyue/tgcli/releases/download/v#{version}/tgcli-linux-arm64"
      sha256 "62f4717d5a0a36e0eecee0824be34932ed7a898168e270f5c36f6c00fbd10551"
    end
    on_intel do
      url "https://github.com/zhiyue/tgcli/releases/download/v#{version}/tgcli-linux-amd64"
      sha256 "db35adadafd8bdf81f8ed3e7972558c76e39fde57419b369d055e03cf6136a38"
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

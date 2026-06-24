# frozen_string_literal: true

# Vendored, auto-bumped copy of dgrr/tgcli's formula.
#
# Why vendored: upstream (dgrr/tgcli) ships the SAME (wrong) sha256 for all four
# platform binaries, so `brew install dgrr/tgcli/tgcli` always fails the
# checksum check. This copy pins the correct per-platform sha256.
#
# `version` + all four sha256 are kept current automatically by
# .github/workflows/bump-tgcli.yml (checks dgrr/tgcli daily, recomputes the
# checksums from the release assets, commits). Manual edits get overwritten.

class Tgcli < Formula
  desc "Telegram CLI tool using grammers (pure Rust MTProto)"
  homepage "https://github.com/dgrr/tgcli"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-darwin-arm64"
      sha256 "ebf5832b5251714cad2f8ec024651af995aacca6f3de9ea5d2681ed833276cd9"
    end
    on_intel do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-darwin-amd64"
      sha256 "a0c95d1aebfb8953c22bbf8ef4ab3299d569eab14d87506be4c8ae56e16db526"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-linux-arm64"
      sha256 "13d43fd33cffd51094c7d4fd4e198c8b6dfe4b5503afd21f808bcc0e4cd38b0b"
    end
    on_intel do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-linux-amd64"
      sha256 "e15b73cdf171c5141a44442969dfaded77ec183ea837f16b125d96e57c2f1987"
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

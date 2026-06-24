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
  version "0.3.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-darwin-arm64"
      sha256 "cfa8d44a51c6ce7ada388bc27114156d7fa2164f47c740b49c76bd74ebcbafac"
    end
    on_intel do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-darwin-amd64"
      sha256 "9a5e11d536d5fa0bc4b9b48f05de1350f1ca2b37de92e60341c3dd341eec39bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-linux-arm64"
      sha256 "fe1a0452922ef65666350fa3200373e18c848b53ebb7e64e303c0a57cf71d0d9"
    end
    on_intel do
      url "https://github.com/dgrr/tgcli/releases/download/v#{version}/tgcli-linux-amd64"
      sha256 "10e7888e4f6020771f89edcf7504afbcdcd00a9a0ef1b9a370dda7e4f939dc70"
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

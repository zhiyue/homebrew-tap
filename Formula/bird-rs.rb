# frozen_string_literal: true

class BirdRs < Formula
  desc "Fast X/Twitter CLI for reading and syncing tweets"
  homepage "https://github.com/zhiyue/bird-rs"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/zhiyue/bird-rs/releases/download/v#{version}/bird-rs-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f03aaa20406c9191efed7dbebfe31cb04573b4074723e232d6dcc48d0c483f7d"
    end

    on_intel do
      url "https://github.com/zhiyue/bird-rs/releases/download/v#{version}/bird-rs-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "dd313ff3a2ac1c23e1b1f6a0c20a1479aa3dd832170c8d043811a2debea7fdf0"
    end
  end

  def install
    bin.install "bird-rs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bird-rs --version")
  end
end

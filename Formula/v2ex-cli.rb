# frozen_string_literal: true

class V2exCli < Formula
  desc "Agent-friendly CLI for the V2EX API 2.0"
  homepage "https://github.com/zhiyue/v2ex-cli"
  version "0.1.0"
  license "Apache-2.0"

  depends_on "curl"

  on_macos do
    on_arm do
      url "https://github.com/zhiyue/v2ex-cli/releases/download/v0.1.0/v2ex-cli-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "e1c7637abe96ac8d42f16e7d884ac96f27dfb18abc3c5243cb21c6615739a5e4"
    end

    on_intel do
      url "https://github.com/zhiyue/v2ex-cli/releases/download/v0.1.0/v2ex-cli-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "c0a19ff469780f72b60ba8071ae1f81850879d42a027af1064e03a74129db81f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zhiyue/v2ex-cli/releases/download/v0.1.0/v2ex-cli-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ae30a97c240fcfad9ed4532bd45b7005aa3c1bc012469ada2cf4ac2dcafdbc37"
    else
      url "https://github.com/zhiyue/v2ex-cli/releases/download/v0.1.0/v2ex-cli-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8190bd662b4c8e8a432f22de4362538d840e6872405c690ed29fbc441748f977"
    end
  end

  def install
    bin.install "v2ex-cli"
  end

  test do
    assert_match "v2ex-cli", shell_output("#{bin}/v2ex-cli --version")
  end
end

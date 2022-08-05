class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.5.1"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "3f942b22a07fc83bf7d264f2d9fdb54407ac6da042492e502d9f84114eb21d8b" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "a141887550c98d88d23ecc3804a948550ca8c03216b88f5e81e8e07bf5b29a5d" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "c6407fbe8eaf49bc179f6a5868317b777c661b383939714b3bdf178246dafbd6" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "1e1a205020ef718657dcc6a2400666cd544e0f3c0c1e4a650f11583f990db4ba" # phrase_macosx_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_amd64.tar.gz"
    end
  end

  def install
    system "mv phrase* phrase"
    bin.install "phrase"
  end

  test do
    output = shell_output("#{bin}/phrase version 2>&1", 64)
    assert_match version, output
  end
end

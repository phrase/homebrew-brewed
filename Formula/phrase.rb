class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.4.5"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "ec18de27908aceb713628c4c78ab83ad67f9f2b75426c34b729b11a6544a6674" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "88c0fd31f6375334f37ed96c13a09ece28f523cbdf1955b981d4fbc055d2fecd" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "e4a8bdccd793cd2a6ddc3eb3d9104adbf68a69d905a4605ca4e760843ee00fca" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "5e7a37b00d189937de6ccc7fcfa31502589d84638019ee9c388f0bda67cbf50d" # phrase_macosx_amd64.tar.gz
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

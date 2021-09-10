class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.3.0"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "41e18474e45c116d63ba7bd2444ecdca38ec34e7c78d3a767f418ee1f1fcab1b" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "e7177263048e4396c1b809a9a209b328356b7535be38ce53085035b163aa4872" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "36a3c22885280403284c122f807d5db37c1156c4539eb91290c510e659ac15d4" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "8cb6aa8cceea6184f98270cd7bad670b40e5f886aea13e9eddb42734b360c991" # phrase_macosx_amd64.tar.gz
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

class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.1.2"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "93857469e73905136ec7d4f55f7638b76a54131f982e1a8cbd8eb233a6fce3e1" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "95228bbd35c8499dd86a3a572d0c4de7a53f370df0c7976ad53dfad756445a33" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "1571d337e7aa965a264f0bee5b4cf693a0e13c2ca8f60eb74b641858fca6c3bd" # phrase_macosx_amd64.tar.gz
    url "#{GITHUB_URL}/#{version}/phrase_macosx_amd64.tar.gz"
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

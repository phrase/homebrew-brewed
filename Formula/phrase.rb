class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.2"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "aabaf11476aec426fbc0b056c17173b175d90d5b43c43a625e612e3688548d04"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "b77c2d41548209d45bcd29daeaf918352bebad809cc77a93c5b5ae7840d3f780"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "a68c9801440b5d5b476dfc3df3957dd7a7d616fb2a19fe5890418907be6ddbfd"
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
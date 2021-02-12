class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.27"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "518f7661a575303d1da1b3a035aa20121b28c1195f4e71d461c4245d13cf2cdf" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "9369a2ae151864aa17f1dc0be47cd2cf988c7402ca0c7afbf76801ed9f4fdf25" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "b5a92e394787b4f07623a67f37283c51005f402e0d28c82c7d79559c1fddb53a" # phrase_macosx_amd64.tar.gz
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

class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.11"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "6d8cba438f5c399b2ba176d2335479c694fb10811574ce832f22373f77affc36"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "e333c4ec6f440607509581aacbbc267518d64af21782bba6bcf2f0a7215a564e"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "faab76ebb094cc81f1f17ac44af3a2356200db2b1f97bcc533057e73c2f23b6d"
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

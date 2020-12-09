class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.18"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "d05dd7e49e6e1cf987ab2b28dd130f88f28d5b804f5139a2328bbc96939d13a0" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "a39f9bea6eda29242bb245c797fa768c1cedf13af9f4f1fa5182444e5bd43900" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "c0de1a333785fe0e5bcaa63ec31e5629840485cb7f604abc69fe0c0e667a3eed" # phrase_macosx_amd64.tar.gz
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

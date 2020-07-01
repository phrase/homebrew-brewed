class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.9"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "856fdd039bde52b59cfbbe78070c8efc22d372f161746538e3391d44386230c1"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "c41b81ac5efdc21e098f4452f361fa76b345748bfda6e918aee3532ff1458c19"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "41c86238b9b8e74c8016b60915a7d9e54e170d1d57a3ac05e7cb01a06543ec3e"
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

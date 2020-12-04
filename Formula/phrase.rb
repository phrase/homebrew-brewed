class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.17"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "a04061d1526575b4bf2df9133eb7c28e36ea84e2bbe1039df13eaeaacfde6800"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "2072bb0d51289bf7c80ca575511a531d581e6b8c6f8463a5bc6113b30e070303"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "e3ed5028da3f3288a4f70df6573d30de690dff1ce7ce69ab5920ac00aa202070"
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

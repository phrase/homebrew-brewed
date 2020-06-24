class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.6"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "5c29edd51de5917afa05b17e7660de55fe8c2611e8b5de8fe301ea23cea809c7"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "e6cc2e1cfd015023c1db59b0257ac81e3983345d5aaba8456670c6d7e07d2f46"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "fc436edf56c7d1fe073641f0ac4dce991645cf1952d4460af1fb1cb4074adfa5"
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

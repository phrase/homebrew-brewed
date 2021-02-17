class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.1.1"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "43129ba031201a0664076a3bfbfc8ccf66bfcbeadaca2e3463fc014b5b97df0a" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "12ee73fb31aae19feb179858c78dfa22c707a827fddb283f7db9b83760e8569c" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "23ec175ae661fb98c9d0d6cce160fa4a48c6c10558c5c191fcad9fc8b3527d97" # phrase_macosx_amd64.tar.gz
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

class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.3"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "0a60cd73f1d6c36915f91bc2ebe634d510c738a4cd2984d6d18f9bce9f5c96ce"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "689b6f9c0614da1fe0d54fa84a6406410b5f801ef0127a2b304dded9a1888453"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "958c60a1989289f1c0496d384f6792ea7bd0ad85af8749927df577169f7c3031"
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

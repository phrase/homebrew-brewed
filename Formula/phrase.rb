class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.16"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "6f41a2f4ca4141228fac2f0ab9d6c9634a1c014b6d699093a060deed276fa0d9"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "5fe1d3d5f4bda494d9717ad2da3953a5ec3a7f7b2e76c5b7c358510141504b9e"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "3ffe2d8ad09104ef466ec8f56018bba505da6d62c10c32f13ec29ec6aa8f2b18"
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

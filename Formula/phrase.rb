class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.5.2"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "1da0c6f85c1ff36d4afa05d228bf54e2116f53dbd1f1f424406a59dfcb4661c2" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "07ef4b973e6b81b5ef71650acd2a5856214261b4830a3924ebc9db12e8395f9c" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "fcb1800c5cbf14b1dbaea3c871693677a623f73088abeed5ead0fcf8f95403a6" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "249408fe01f59ebd4d157ae14b770b04228a2f944df0a5e654761f78fe6211ab" # phrase_macosx_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_amd64.tar.gz"
    end
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

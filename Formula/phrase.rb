class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.4.11"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "c6eacc92ae7a97344bd4e79d61f07077a1c5da4016501861f3d0dca6a6e93ff9" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "b2436b955a4db45bb882ccaf7a502733a6246129a998aca21a211ef041a5803b" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "ae0e73c6c2bc903c3fface8c16040b7b9d57e066926039adaa7a30f94d1ebca3" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "214289742b26a058bbcc72a8a5c357050e18ea8e14744a96b3a96082efa0c2c0" # phrase_macosx_amd64.tar.gz
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

class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.2.1"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "c84248a89636ca3943d7a379b663d0020869d4f804b6301a0577350df043c686" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "cca345574b71a35a0e4743daeed7bc5f209f933122f0792191e5beb46b735380" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "1cb8be2c63026420ffb086da71d83b8145134abbc348cd1e05d41ab7c9083600" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "65140651c151cdf941d4431239f4a7a0e9d789e841fbd755e1540609bedff02f" # phrase_macosx_amd64.tar.gz
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

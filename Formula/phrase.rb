class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.5.0"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "a98e96468a39a6498dc80b995a83185bab1ff27a719f73510b06c8f9c39b3f33" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "2903511452cf979eb9bf31710a9c15ab63721c5de3e6b4f403751a89ef0ad307" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "021a839487bc291382d437a4abc233ca2c1b46bf57130de8cdb57a8444323a45" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "cabce880af4bdd68dc84217accfe8496cda19ef3afe64025c3a9dcd096669f73" # phrase_macosx_amd64.tar.gz
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

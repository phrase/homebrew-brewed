class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.4.9"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "4a26478d721de9fd287e610d5c30a38162bb0399164e00de51b159e3569317bd" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "55de3d03e49b512e8a35e6ee6c81b8a083af885ede22593bf9640bfa87ac4df5" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "a0e4c50c750869ac234850993aca9fe92c6ac7a5d9433b830a3b5cb691bc0e9c" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "d3d78ed5132354fab60505ba849a54bade632bee053dfb344c3d522a06480249" # phrase_macosx_amd64.tar.gz
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

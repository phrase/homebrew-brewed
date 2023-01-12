class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.6.2"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "b23116f23030009a99d3057caec2c12a2f9e86707a8169334498c0ca939b9fba" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "ca840e751bade9a4b0771b516f2cfc9483e7c836ee00305b2eeb952be6b1f724" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "c513820ba1920ad241dbd5ad86e814da4330919a345db21521b8241b3f176027" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "c7ce7990cbb9d3e0631d375e263f915f5b5f64cdc99f6496ccc6d55afaeed3f5" # phrase_macosx_amd64.tar.gz
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

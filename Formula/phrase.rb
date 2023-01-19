class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.6.4"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "490cf436f924925e7f2c2043d56e5f2a0a9e0a2d15cbce6e07cf79e4a0bc9888" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "805fc68b905e451b2d27293086b6f393d7053a5113e1e30c8fcd76c8383e28ba" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "3eaa8c6e00182c8c457f2ff2f45114d6c12e038a5a028345758f7547718a6859" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "44133b3515a2ee579fb6d616c924d9f1c18b6922f85517c9099580be80291236" # phrase_macosx_amd64.tar.gz
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

class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.6.3"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "cbdbb1d476aa03bb82393d6e456e0bf47f0c19de1aa679ed2affc01d89689d22" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "c1f7a9e5370ff4fc7004a409158963c1fee9c4e92ed9c6b10827d6ad0d4cbc0d" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "e6026e1a0ab191987a6d90f672444dd81c383ecd0cbbe104961bdc7c565e5697" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "9d18d3daf83303ca1f502cdcc10fb56cf33ec879ee75dd07e8aeb7e6bef8fea4" # phrase_macosx_amd64.tar.gz
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

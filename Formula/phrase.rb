class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.4.3"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "1b689bb8da61dea1d752a97aa5c721040601fc5b3936dd18acc12aabf2ef6996" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "42ccfb6453baa46715b67764f32e6f199db82fcc9e0d3a83ac618d9203007441" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "cd97116fc39b297834ba537acc5dc6156ba33a593f13f643d3b6061eb0f5ec2b" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "d27b654103b243b67c513f6dafd48e108fa3b6ef754099c0c9a262bc981fea85" # phrase_macosx_amd64.tar.gz
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

class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.6.0"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "0363f69bb3ab03652a4edcc7f08b7f42ec16bdfe3a5e73c3fb4a3792c9122291" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "de31336e763f9fd2090330677e7abadcfd0dd04492eb7a26305155cac796cfff" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "3c2e4ba7c8a50e0f8fea424b411589061a7a2461d1354eefbf95643d40248971" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "f6235fbe3a6f3efdf9a5679e32548e8c0fee801db69413a927f123a8ef80cfcf" # phrase_macosx_amd64.tar.gz
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

class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.1.3"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "746ec8c2d9a5df49d80162e3f0e38108af90e90ac87f4b7aed225e55b2b7cf87" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "9ebeafd56e1ac1d1d3a0f8f28ea49e2dc738c3852715f3ae4b94197866b153c1" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "d7a7b6d53893a4c3a4ba60bdcd6d8c17f8d06b61d695cef76e332a894bf1e7ce" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "73991a68cd6329be163e87adbf0c30cbe3587e8a9fb62bea0cf86b32596209c3" # phrase_macosx_amd64.tar.gz
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

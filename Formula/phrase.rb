class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.6.1"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "5bbb5ac3294b7dadcde3a741b379e548cb3e4083565ed64a061c5b93633d7cad" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "cece4a0f50ef6d93c0619aec33e23585a8830af7a80c0a594e257860d76b3afc" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "0efda3a84e821fab35c0e68770183813d649d002c70f0eb44a9e62272360340a" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "119a809697a630e6ec81c83b8bfc60fc2a2b74b10e1cf45947af7b7af2341e78" # phrase_macosx_amd64.tar.gz
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

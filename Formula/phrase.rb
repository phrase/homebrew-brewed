class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.1.7"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "15d2d151db941b1ef6ad631871d2b6f12f0a3b9d78e34a4e79a62abcb22b32c1" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "f15c0e3524d1f96dda4d0ed629a5a349398073226845c249d2f291d42e33589f" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "4212754c45777c275822fe017a2505d68dca547a0f5974871d040144bc4dfb30" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "75440b853b2b4523804e9d384009e03334e8e2f68f8656e5ca275f96769a04c3" # phrase_macosx_amd64.tar.gz
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

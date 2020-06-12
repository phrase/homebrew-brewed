class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.5"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "88fe3665149876f9fb986d8403eac62387fd7a9ff0aa0905e7735ca4b99af97e"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "1fc7c01fb3481a28622e8c8a16a0eae9a0a55445c3107dc6e1c56685b679e25e"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "bd8ddad51791ba45c33177d878633243e5ee8806948df360745b4203aea3a83a"
    url "#{GITHUB_URL}/#{version}/phrase_macosx_amd64.tar.gz"
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

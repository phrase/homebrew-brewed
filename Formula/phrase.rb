class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.22"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "98429bfbd7ef4a032de155733c09c1fcb440c643f40fbe908d336d339af1666d" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "1968a48ed257c0a33d31921f977428c69fa399d7f214d63239aca9345623ca53" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "335d94b7ceeb9d9faab81f989bc990dbea8bfde1e7e870f237f79d497e42b415" # phrase_macosx_amd64.tar.gz
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

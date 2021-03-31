class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.1.6"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "a4b40c4d2f29ca70c123d8c4f70a5c957a2a58ada5b6127e51207703efabb576" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "f9193e1e1cdaf9c133881e54bc624cfe13d0b38a958a95babef2e47d46ffad39" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "aa9f5c6cac00f4454169347e9db262d8a66e7d0cb31a26213dc4b69d322eac8c" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "894a9cb056c4439f50aa50c226db4cc8a8a9c6212935aad06c76569cc5bb8128" # phrase_macosx_amd64.tar.gz
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

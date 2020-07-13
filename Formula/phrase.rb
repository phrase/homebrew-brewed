class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.12"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "b91e8b485bb31db2b5ae2bee7638daed1f981f38415064145801bd40a2dbcf5d"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "9bd9964946c3ee9b9602cf984506d70ed2e06d4fbd2fba653a84dab3c34b803f"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "462652963f876b375ee8e36c170a91dc625de3f24d64806c828d2a71b167d8f3"
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

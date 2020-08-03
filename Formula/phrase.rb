class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.13"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "ca05d020284be8eb21ea0041648d2ea190f969aee6a2738629c3ed630c3748ed"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "07b6e99575d598820e2d1e48662fb859dbcd90d516179765e037496aa2da43f9"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "2f9663428730a337e56f0273722d79a0e8f2fa9491612e517a47fe2c2c90d3dd"
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

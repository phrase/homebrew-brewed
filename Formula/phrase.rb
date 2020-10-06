class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.14"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "d14524ffd643c442e0c90b660742ef085a8568c405b2e8b139fd4b982c4dbec1"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "5260e65bc94d69301be90f82cbbc5f3472860bdc503f240e07fe74db2a5ac33f"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "c754e6374b6bf4a3cd738b159a6fc9c81df6b34d8dff939ce7c4396a8cd556e4"
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

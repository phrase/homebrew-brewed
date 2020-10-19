class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.15"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "d999ee1e9bd5e60d528e2f74cc0a152e6b27f102e4840d1d8335463f561e8a2d"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "1d52a5882b8c378881b5d04623bd1317fe0687bcf0150175d3986a3c7fda480b"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "47796c8317197b8d322f529b1340af2ad3ad48f57216192d4ccf954212fccc5a"
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

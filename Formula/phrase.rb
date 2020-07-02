class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.10"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "3382b2312569d9ddb07d8afd1d01693004af7545ab665394360df260fe908d03"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "fc2d83437e828977c20ef7c429e3604b531b1e071cbf3b216e020272d8d1704b"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "95f89218a5a07a866d6fc24ed1d3223dda898d574197a5c65119c5f676a8de7a"
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

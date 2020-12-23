class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.26"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "d161d3456204dcd5fc79ba9a5bfad50493d526362dc77f315cc63429179ad08e" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "b9f0d7b8e4ed9ba2887d6c5de2415c64856647056e76e17bcd72327b9b9fcbda" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "7003437e53e8779ac9705e97155378eb4cb9de8eb46293d262555fae5de5faef" # phrase_macosx_amd64.tar.gz
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

class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.28"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "3d55b458fbb9b67596edc015b5fe8358c8ff03db9f2a0c238de96f49c26141eb" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "5f181fe68864ede750fb749840b53bdd4fd31a738854d076831ea6941695d179" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "773c778181ce94b90ed99474d83270d218c84886abe601a6bfe685aa8e654a43" # phrase_macosx_amd64.tar.gz
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

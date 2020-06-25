class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.8"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "bac2e67c329b3fbeaa97070e8658a30d12271c0e20a1b481235c953d38dc4ac3"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "e8e7a2cde2a2762b1f66a93a9665559ea0353760260ea512e10a35797fea49ff"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "83792f09b6b0a04e3d271d58deb5220a6c66bef9618920657ba9938191f9f854"
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

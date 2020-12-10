class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.24"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "673df6b9dd6001bac4f7a07d126d0016bb239ca30d79ce2a4b8d74104448319c" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "1fd9287d9ff9a5ac6dcfc2ab945de442ef0f9db4030ec15fe2fee03c45899cf5" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "d2a139330720e1d9a0d44cc1b385f58e5919b3b4e8da2b84c9702d4f77ccb859" # phrase_macosx_amd64.tar.gz
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

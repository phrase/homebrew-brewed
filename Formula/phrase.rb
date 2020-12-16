class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.25"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "b9165729e267964b9242d6cc8f41df24efeb1f25c58bddc2e1e14e2e07d12f12" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "3371e194adf1e1ec884b39149a08157d7bb632b2f5164ff8e58e473656ec205c" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "e3cc2b7ea58277b043b2c6d25d974751e0ca8a236d729b48d01119b662ecfcf8" # phrase_macosx_amd64.tar.gz
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

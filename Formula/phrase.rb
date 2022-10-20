class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.5.3"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "e35f7fa07a1c2986955ecd8e0f93875b760f472643be389359a4b36ef7a4b9be" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "eddad5b82a0433b142ba54d14fa9155cca71c34a739d1228680bb7efaecce345" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "0f9868daf27b0ae995d2e461a884348c59a8eda7ae192309528ce29704753376" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "d7cb8472ffb80b529378bc847fce42b6c5e6596f3df4107b173bd357ff5ce38a" # phrase_macosx_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_amd64.tar.gz"
    end
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

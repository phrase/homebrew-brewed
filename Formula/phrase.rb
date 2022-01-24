class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.4.2"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "888d96dcc8b958859f20264b64325f50f48426a341d52bbb407e1c9f4cf649fc" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "a1582611e10f046c86b87336a76254a9f7fa63605dcf8438b509501a96b8127f" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "9f63dce42338e26624b675772f188be05e5ae63fb70f8f86112103ea88fe21b6" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "80b23c6247a4fda014c76ba28967f9d9f2ebb62eda495a1be77aec00fa4e851b" # phrase_macosx_amd64.tar.gz
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

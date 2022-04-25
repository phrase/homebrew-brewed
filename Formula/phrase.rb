class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.4.8"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "0dff3035849090d5ad9873680ec69d867fbfef762975723426b77dbc198bfb1d" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "594cfb2daef465cedff2f9bfe822afb07652eda568ab6ac8f03872d19d1c188f" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "61d9e9da481b52e4514c15f3a9dd36232cc7ce0b9a00fce57e7d5d5c5033f81b" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "1e99348420964b8278f274cfdf4b6f2ff286a61895d90510430164491bf1cb04" # phrase_macosx_amd64.tar.gz
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

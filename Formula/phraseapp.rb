# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"

  version "1.3.0"
  sha256 "4bb4ebb91ee4d3993bdced60d15458a4e44530c3afea900ca46a5fd8e8dfbfae"

  url "https://github.com/phrase/phraseapp-client/releases/download/#{version}/phraseapp_macosx_amd64.tar.gz"

  def install
    bin.install "phraseapp"
  end
end

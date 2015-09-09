# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"
  url "https://github.com/phrase/phraseapp-client/releases/download/1.0.2/phraseapp_macosx_amd64.tar.gz"
  sha256 "dcf8fda495f639ee30217ba913ae8ce6d5ebaea69760047afcac5a0b09406999"
  version "1.0.2"

  def install
    bin.install "phraseapp"
  end
end

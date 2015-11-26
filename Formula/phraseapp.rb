# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"
  url "https://github.com/phrase/phraseapp-client/releases/download/1.1.5/phraseapp_macosx_amd64.tar.gz"
  sha256 "e78d04662185b361e1b015b81a17b6f8c5bc43585cbe9a167ed61678758031d1"
  version "1.1.5"

  def install
    bin.install "phraseapp"
  end
end

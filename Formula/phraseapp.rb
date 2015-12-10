# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"
  url "https://github.com/phrase/phraseapp-client/releases/download/1.1.6/phraseapp_macosx_amd64.tar.gz"
  sha256 "76c4b5807f21f54becfae57c7da9f0be2a2f570c5fc843b52279b06e22136f71"
  version "1.1.6"

  def install
    bin.install "phraseapp"
  end
end

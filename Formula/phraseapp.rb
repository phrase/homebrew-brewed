# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"
  url "https://github.com/phrase/phraseapp-client/releases/download/1.0.1/phraseapp_macosx_amd64.tar.gz"
  sha256 "4b1aa4c36f7c92618904d6882817e8459e3420f146e4864555dbe6ab9b65a192"
  version "1.0.1"

  def install
    bin.install "phraseapp"
  end
end

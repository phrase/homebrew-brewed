# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"

  version "1.4.1"
  sha256 "8c278cd1d32fcac4274ec42a0cb6904d2c569af4555dee39b58e6839a5816c19"

  url "https://github.com/phrase/phraseapp-client/releases/download/#{version}/phraseapp_macosx_amd64.tar.gz"

  def install
    bin.install "phraseapp"
  end
end

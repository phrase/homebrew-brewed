# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"
  url "https://github.com/phrase/phraseapp-client/releases/download/1.1.1/phraseapp_macosx_amd64.tar.gz"
  sha256 "cfb2b35499798eec2d3e7ca9bfb81d51ff7ce6cca14de63056efcc834f591c33"
  version "1.1.2"

  def install
    bin.install "phraseapp"
  end
end

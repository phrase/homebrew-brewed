# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"
  url "https://github.com/phrase/phraseapp-client/releases/download/1.1.3/phraseapp_macosx_amd64.tar.gz"
  sha256 "8b36ca3eb29a5d538c5e62bc6b58d90eaec84122474af88f655de0002c8f0a6f"
  version "1.1.3"

  def install
    bin.install "phraseapp"
  end
end

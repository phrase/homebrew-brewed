# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"
  url "https://github.com/phrase/phraseapp-client/releases/download/1.1.7/phraseapp_macosx_amd64.tar.gz"
  sha256 "bca2a63670268b62b305d94d9b15a95558c7ecbdffa7b187d8693af4b99df1e3"
  version "1.1.7"

  def install
    bin.install "phraseapp"
  end
end

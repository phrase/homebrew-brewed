# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"
  url "https://github.com/phrase/phraseapp-client/releases/download/1.1.0/phraseapp_macosx_amd64.tar.gz"
  sha256 "3bb48502e31f4cf0260b22942db2b476851d7ca6996c6cbca5ca7a27e8b4a99f"
  version "1.1.0"

  def install
    bin.install "phraseapp"
  end
end

# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"
  url "https://github.com/phrase/phraseapp-client/releases/download/1.1.4/phraseapp_macosx_amd64.tar.gz"
  sha256 "e979a03fc0c6c7b2d3f00d9be82e5c26954a77ba841ac4155711d4352031cf98"
  version "1.1.4"

  def install
    bin.install "phraseapp"
  end
end

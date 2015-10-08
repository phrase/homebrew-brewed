# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"
  url "https://github.com/phrase/phraseapp-client/releases/download/1.1.1/phraseapp_macosx_amd64.tar.gz"
  sha256 "1fda01abc1a51d0b57413522b0f84719658f842a6ca87eaeff9fced73877aa5f"
  version "1.1.1"

  def install
    bin.install "phraseapp"
  end
end

# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"
  url "https://github.com/phrase/phraseapp-client/releases/download/1.1.8/phraseapp_macosx_amd64.tar.gz"
  sha256 "3d951bff2e7090e28b65d4d52ef8b5b3e111aee74d2a9954d26a2761ba8aee28"
  version "1.1.8"

  def install
    bin.install "phraseapp"
  end
end

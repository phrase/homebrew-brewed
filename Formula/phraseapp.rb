# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"

  version "1.4.0"
  sha256 "f9ae4139694c46c3855aaca7bd1f8e3157b7eb3583d7e6a14ed51fae34abc6d8"

  url "https://github.com/phrase/phraseapp-client/releases/download/#{version}/phraseapp_macosx_amd64.tar.gz"

  def install
    bin.install "phraseapp"
  end
end

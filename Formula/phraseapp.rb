# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"

  version "1.4.2"
  sha256 "a2c240c5b633ca99891bc54070a1be5e66d53aeb73442a9aadbe99f138748c5f"

  url "https://github.com/phrase/phraseapp-client/releases/download/#{version}/phraseapp_macosx_amd64.tar.gz"

  def install
    bin.install "phraseapp"
  end
end

# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc "PhraseApp CLI Tool - API client binary"
  homepage "https://phraseapp.com/cli"
  url "https://github.com/phrase/phraseapp-client/releases/download/1.1.2/phraseapp_macosx_amd64.tar.gz"
  sha256 "4e3297d29adc70e2aca65b3386a56c833a2ca118433de3e8a620e4d22193175c"
  version "1.1.2"

  def install
    bin.install "phraseapp"
  end
end

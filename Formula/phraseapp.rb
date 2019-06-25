# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc 'PhraseApp CLI Tool - API client binary'
  homepage 'https://phraseapp.com/cli'
  GITHUB_URL = 'https://github.com/phrase/phraseapp-client/releases/download'

  version '1.14.2'
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 'b5285e40228efa079c33aab251b5cbeb6f01cc075243a9b3249f40b3519683c3'
      url "#{GITHUB_URL}/#{version}/phraseapp_linux_386.tar.gz"
    else
      sha256 'abfb82ddc99f7177c78d29951a136fc4e90e6b417154735b111d288450617ce8'
      url "#{GITHUB_URL}/#{version}/phraseapp_linux_amd64.tar.gz"
    end
  else
    sha256 'cc4f885945443cfc3ce7490b6e56e39810ae6db66d33f9125cacd655ecceabe7'
    url "#{GITHUB_URL}/#{version}/phraseapp_macosx_amd64.tar.gz"
  end

  def install
    system 'mv phraseapp* phraseapp'
    bin.install 'phraseapp'
  end
end

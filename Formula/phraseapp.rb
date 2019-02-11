# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc 'PhraseApp CLI Tool - API client binary'
  homepage 'https://phraseapp.com/cli'
  GITHUB_URL = 'https://github.com/phrase/phraseapp-client/releases/download'

  version '1.13.0'
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 '5c9d012c01052fc0e0fef28230a11c41a543bddabac392dfc0a1dee30d64b869'
      url "#{GITHUB_URL}/#{version}/phraseapp_linux_386.tar.gz"
    else
      sha256 'fb938f399e9f5b573cef55930b38647b52060df0e09bf9c2cc1079c5f3b6f277'
      url "#{GITHUB_URL}/#{version}/phraseapp_linux_amd64.tar.gz"
    end
  else
    sha256 'dfae709a1271c3747fe7dc622b6ffc0c04c65e46c5980239b2514052a13f8b6b'
    url "#{GITHUB_URL}/#{version}/phraseapp_macosx_amd64.tar.gz"
  end

  def install
    system 'mv phraseapp* phraseapp'
    bin.install 'phraseapp'
  end
end

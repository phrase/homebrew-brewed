# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc 'PhraseApp CLI Tool - API client binary'
  homepage 'https://phraseapp.com/cli'
  GITHUB_URL = 'https://github.com/phrase/phraseapp-client/releases/download'

  version '1.14.0'
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 '9aa5b23be464c3a12dd011edf5480d5bc0bbc814bf09b5a49f80e7db89551abd'
      url "#{GITHUB_URL}/#{version}/phraseapp_linux_386.tar.gz"
    else
      sha256 '016ff776f04154460e86dc49c6b0d091e05bb414c004853be1bf3bab53f42bc9'
      url "#{GITHUB_URL}/#{version}/phraseapp_linux_amd64.tar.gz"
    end
  else
    sha256 '0633a8c3f7fb7412fac1f9d19cc91ede584182d729b70485d2c642a90450c922'
    url "#{GITHUB_URL}/#{version}/phraseapp_macosx_amd64.tar.gz"
  end

  def install
    system 'mv phraseapp* phraseapp'
    bin.install 'phraseapp'
  end
end

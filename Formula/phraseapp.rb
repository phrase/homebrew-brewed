# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc 'PhraseApp CLI Tool - API client binary'
  homepage 'https://phraseapp.com/cli'
  GITHUB_URL = 'https://github.com/phrase/phraseapp-client/releases/download'

  version '1.12.4'
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 '9fb98aa72fd591e920724291a556820b21da6c1a3edfea3f2fa4233a45a51ea5'
      url "#{GITHUB_URL}/#{version}/phraseapp_linux_386.tar.gz"
    else
      sha256 '993ecfbabeb4697dcec34ba89a22e581dcee8ee8a4db293d0c07ebc134ccbfaa'
      url "#{GITHUB_URL}/#{version}/phraseapp_linux_amd64.tar.gz"
    end
  else
    sha256 '6e8527314178e7c841ae456b27f1828654dc2d211cdcd6b2999ad6349aa7f9cb'
    url "#{GITHUB_URL}/#{version}/phraseapp_macosx_amd64.tar.gz"
  end

  def install
    system 'mv phraseapp* phraseapp'
    bin.install 'phraseapp'
  end
end

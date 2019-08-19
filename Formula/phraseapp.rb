# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc 'PhraseApp CLI Tool - API client binary'
  homepage 'https://phraseapp.com/cli'
  GITHUB_URL = 'https://github.com/phrase/phraseapp-client/releases/download'

  version '1.15.1'
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 '2cee40f38deccef57254ebf3d97b68d6fde5f95306b0de15e72270f60ba604f2'
      url "#{GITHUB_URL}/#{version}/phraseapp_linux_386.tar.gz"
    else
      sha256 'cd5e44cfbe7d358d60e8fcf607b5c23ab1a5ae2d016e9fdbc07af2fab8c4cdbd'
      url "#{GITHUB_URL}/#{version}/phraseapp_linux_amd64.tar.gz"
    end
  else
    sha256 'dee73f13a3f30e13ce111eefbd8b0554b650eb854cbbebb441ff7f762f3efd50'
    url "#{GITHUB_URL}/#{version}/phraseapp_macosx_amd64.tar.gz"
  end

  def install
    system 'mv phraseapp* phraseapp'
    bin.install 'phraseapp'
  end
end

# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc 'PhraseApp CLI Tool - API client binary'
  homepage 'https://phraseapp.com/cli'
  GITHUB_URL = 'https://github.com/phrase/phraseapp-client/releases/download'

  version '1.17.0'
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 '29960f4381c0a2622a2167876e23e0634fc5ced40c2efc39c2e1fe981499dc40'
      url "#{GITHUB_URL}/#{version}/phraseapp_linux_386.tar.gz"
    else
      sha256 'bf5785c6fb6b243a1f1d2436f92c645ea7f0a689dfdc8501ccf966af623b2f1b'
      url "#{GITHUB_URL}/#{version}/phraseapp_linux_amd64.tar.gz"
    end
  else
    sha256 '9b33249d4ddea9908d9833bfbb4ae9be8dbf3e346020a2f1debc756deb73b6fa'
    url "#{GITHUB_URL}/#{version}/phraseapp_macosx_amd64.tar.gz"
  end

  def install
    system 'mv phraseapp* phraseapp'
    bin.install 'phraseapp'
  end
end

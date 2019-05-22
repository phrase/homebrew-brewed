# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Phraseapp < Formula
  desc 'PhraseApp CLI Tool - API client binary'
  homepage 'https://phraseapp.com/cli'
  GITHUB_URL = 'https://github.com/phrase/phraseapp-client/releases/download'

  version '1.14.1'
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 '16efe21b05fffb9b96453d54ad4a68e9ceda48f6676895087c534dd85e8440ce'
      url "#{GITHUB_URL}/#{version}/phraseapp_linux_386.tar.gz"
    else
      sha256 '8774ecd2b4211f8afafbb983d79d6387d0d5513f535a2b1e7916629a9f80a297'
      url "#{GITHUB_URL}/#{version}/phraseapp_linux_amd64.tar.gz"
    end
  else
    sha256 'bbba065acfd2a060f3823d2a8990cc6627b3027661028360c384d69ebba55f88'
    url "#{GITHUB_URL}/#{version}/phraseapp_macosx_amd64.tar.gz"
  end

  def install
    system 'mv phraseapp* phraseapp'
    bin.install 'phraseapp'
  end
end

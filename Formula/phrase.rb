class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.4.10"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "64e0d05de4cc33920528519e423c8a6202e4cee7dad38c9fcdb0dd86d41bbea9" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "bcd5c94a67917f1f48702670e22b13c46a57c6f3009e6e6f4cbd245a51ac4494" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "30431b37e20a8350e08578594553466a32fff00b274c6bedf0cf4d7b6e64bc98" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "85a579402071ee3222303619f05497acbd93d59623ba361e977b8793a279d31b" # phrase_macosx_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_amd64.tar.gz"
    end
  end

  def install
    system "mv phrase* phrase"
    bin.install "phrase"
  end

  test do
    output = shell_output("#{bin}/phrase version 2>&1", 64)
    assert_match version, output
  end
end

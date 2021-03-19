class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.1.5"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "c619a9239caa2093901704df3463f768f909fcd39c7d6cf309d5c46c5a68c1ee" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "9d58aa530020aec275687f1c750707876970fde2accadda1a845d10b9c7542b7" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "5ce51f02f0dbc9a2bbed34605187f9a3911371871b656d8e7571855ca4157b5d" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "3ae37e901b2178d5e2f1fff261fb04439db1b6f0292701ae15212a86b11cdba5" # phrase_macosx_amd64.tar.gz
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

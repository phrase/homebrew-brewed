class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.4"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "ee599c1e07f6c36782e6d460f59ef2884b4d0f2961e4dd962e12c805b27aa175"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "55242600f0fab459fdada18e4700a938e2ccdeb3c3543a67438465aa6e5250d8"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "1ad896746769c904d2fb8cbed7611a66935db8db4f7747edfc02b5be8beef81c"
    url "#{GITHUB_URL}/#{version}/phrase_macosx_amd64.tar.gz"
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

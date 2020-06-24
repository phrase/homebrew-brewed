class Phrase < Formula
  desc "Experimental Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.0.7"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "222322602db5dd57f9742d0ec476c5a6e0a56074f43e8350fda8e2b9344f80a6"
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "6b931d64e0b473b5b4b23cc719df2570476de7474c29e1392f014e1fe392fb4b"
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    sha256 "c949b42d023964ff7e29e2812ca89ea8f826ab47c55995b5763414d66659bb05"
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

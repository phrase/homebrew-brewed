class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.4.6"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "15e443f6ef4de6fab60971f0b5c939a6c1057b0ca7eb76345e5c7d33387e5351" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "31dcd72fff55486f53847a43886953580033cd9d0b19ba806cda652afa2ec265" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "22500423df1e9f195fff672290687cdad3e5a32662a47877373dec355e8c72b8" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "e8f85b65654daa036c4b502142d87ba321bae7167b5f1445d29ca52df73fb1ce" # phrase_macosx_amd64.tar.gz
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

class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.4.12"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "9a19a6eeb10770c86b8b8e80389a7394e206438c6e74cc18295df01faf868e09" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "07acda241a7b9bbe01bf44f6f115b8cecc5190643951a1402840d0ffe3d22902" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "f8be20305c44df7e0fa22cb2b37e847bdb99673cb88ae5d0651089528fe93fbc" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "8aab317518415425345cba639d5d5992030279028876f22fd2fd9ba950ca96fc" # phrase_macosx_amd64.tar.gz
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

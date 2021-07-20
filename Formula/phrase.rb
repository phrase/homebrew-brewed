class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.2.0"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "65e2d659e66b119d72dca21009ddebf7eab37a3379b6b8cb89c41bee4b0ef798" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "7d8e2092b936a078ab28d6d04f4d4174f9c60f50cb29fef31c632f6e52dd549c" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "55713378c57ab818db323e28492107295cf668c9554bb277ab4dafad17634f9d" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "faf626a6cf9a4755183e675aa9fe3eedfb59cefd2d3f9b7dea1bf03e2bdca9fc" # phrase_macosx_amd64.tar.gz
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

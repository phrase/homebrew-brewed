class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.5.4"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "fee33c78089c5f799958d1243543f550799792bde7ab53bd6eae6518837f2554" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "1b61e1d046107327bbf0c30e6d8302f8534e3ab530f06aade355e43d4f3b1a46" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "a1e90623647826bcad2579509975f32ff6e1a2f198a7e2d324fe3a20f7573c5c" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "a14b5592f8fd70f7f55811b71022674ca4ba0586d18cf334e765571b71ee339f" # phrase_macosx_amd64.tar.gz
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

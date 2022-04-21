class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.4.7"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "fded75a3f432008e12c1f69769651e51c7c55aec2e1d2b8ab9fb9df1582eb397" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "b42a8cec25b09dce6a47ee91aeb420247d514e330e3aa66e554e8573d6d7676e" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "fd2e5ae23209b2ee9b72e9940dedbcf4bd8046835e5bedee17a95a746ba425b1" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "3f84d71c7d274d86593aa89d3113d79d3d0673bc9378aa771ea77cd8c52e652b" # phrase_macosx_amd64.tar.gz
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

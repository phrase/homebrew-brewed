class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.4.4"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "3e11554f64b38e387072d92066242cb1079a39e92578d673fa77b094d09f6df1" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "ba65351a8a8543786062496e72097c4c600450f4b4826ed9bdb4afd0a234e8e6" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "b0699d2d050f3ba8de32672bf1ea70eba7286720789324597892df0d84e2fdf9" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "e9443903fe4209e839dc2618b9c4031c33e1dcc3a2b659543e71eecd5b6926d3" # phrase_macosx_amd64.tar.gz
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

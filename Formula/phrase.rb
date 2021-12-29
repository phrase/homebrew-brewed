class Phrase < Formula
  desc "Phrase CLI Tool - API client binary"
  homepage "https://phrase.com/cli"
  GITHUB_URL = "https://github.com/phrase/phrase-cli/releases/download".freeze

  version "2.4.1"
  if OS.linux?
    if OS.respond_to?(:bits) && OS.bits == 32
      sha256 "a39cad3e222dcb39e8ef7942af074e42072210a2aefa18e26f427636c551d1ef" # phrase_linux_386.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_386.tar.gz"
    else
      sha256 "845857e3d3025f0eff47372ed38fb0bcab3b7568891885b0f623ba9a1168eccc" # phrase_linux_amd64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_linux_amd64.tar.gz"
    end
  else
    if RUBY_PLATFORM.include?('arm64')
      sha256 "d40936b23ddbc78d402b4cf25650eb2c47a75c28daead3d122ff0e426aa6a566" # phrase_macosx_arm64.tar.gz
      url "#{GITHUB_URL}/#{version}/phrase_macosx_arm64.tar.gz"
    else
      sha256 "a00ccd8f95a1ac3748af1fe28a4e64628be6ffbf3cce92c6ee6b93b216c59eb8" # phrase_macosx_amd64.tar.gz
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

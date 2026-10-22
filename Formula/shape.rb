class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.74.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.74.0/shape-0.74.0-macos-arm64.tar.gz"
      sha256 "e38ba76e4931a51b2ca6b42231bca086bacb786c5ef501206c4c50c68cb26c18"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.74.0/shape-0.74.0-macos-x86_64.tar.gz"
      sha256 "5bec16bba6eb852b4ba515e2fec1e2c0aa758fac78f9272c35e36e207b8c1b9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.74.0/shape-0.74.0-linux-arm64.tar.gz"
      sha256 "458511d18d0e67a620cf3ed5ab3c1be826b8cc646047a3f0e9d7f75c47fc838d"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.74.0/shape-0.74.0-linux-x86_64.tar.gz"
      sha256 "1f8e6d027f268968bb23877be33f8744870d6c292e0be1854bccdf6602fa5203"
    end
  end

  def install
    bin.install "shape"
    # the command's name before the rename to Shape
    bin.install_symlink "shape" => "diagram"
  end

  def caveats
    <<~TXT
      Own file icons, and open boards from Finder: shape install-app
      Agent skills for Claude Code: shape skills install
      Merge boards element by element in a repository: shape merge --install
      `diagram` still works: it is the same command.
    TXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shape --version")
    assert_match version.to_s, shell_output("#{bin}/diagram --version")
  end
end

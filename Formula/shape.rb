class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.62.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.62.0/shape-0.62.0-macos-arm64.tar.gz"
      sha256 "c519e28bf650c25c28a0899357646268454a669b453ced7b364b98a599a9f610"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.62.0/shape-0.62.0-macos-x86_64.tar.gz"
      sha256 "bdfd505a186ac7041953313d61b3b4d4a7a5be56f0bdc66f14dd88450b686f5c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.62.0/shape-0.62.0-linux-arm64.tar.gz"
      sha256 "bdc0f1c334c023cd3f6932d7b6f95eb59f784bab914a3541dbf566b132ca7990"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.62.0/shape-0.62.0-linux-x86_64.tar.gz"
      sha256 "0c0a25de442bf9f437f21fd0567cd30114c0b6501f12cd3f6aafa88a56aefee5"
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

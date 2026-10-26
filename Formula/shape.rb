class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.83.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.83.1/shape-0.83.1-macos-arm64.tar.gz"
      sha256 "071f28e80388d5120ba92e142f640eb4e7776fcde5f27c1a437e42c63a08de40"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.83.1/shape-0.83.1-macos-x86_64.tar.gz"
      sha256 "c73c150b488238309ba1675f019ac9aeba6a3bbc285226dc315b6b925d8fa19b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.83.1/shape-0.83.1-linux-arm64.tar.gz"
      sha256 "99d177357cffb1feaf0ab2117b0610acdf1f44bd0b2312806399fb13bed29520"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.83.1/shape-0.83.1-linux-x86_64.tar.gz"
      sha256 "8e21dfe8f692fe8c55ab4e6e6fdab0e3d411b95a9f6567b431a3a06175fd9b94"
    end
  end

  def install
    bin.install "shape"
    # the command's name before the rename to Shape
    bin.install_symlink "shape" => "diagram"
  end

  def caveats
    <<~TXT
      Open boards from Finder: get the app, https://github.com/dobrinov/shape/releases/latest/download/Shape.dmg
      (on Linux: shape install-app)
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

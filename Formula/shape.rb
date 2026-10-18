class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.56.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.56.0/shape-0.56.0-macos-arm64.tar.gz"
      sha256 "bbb95c91a73860ea479edffcd094b24e57d5f590cadbcb700113491beff86f58"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.56.0/shape-0.56.0-macos-x86_64.tar.gz"
      sha256 "8e9ff6bd88c964569d1f8a0526e1087047651b63d8195ffd3ab7ce5c4ef6895a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.56.0/shape-0.56.0-linux-arm64.tar.gz"
      sha256 "660c7de383d1373da768ad4c99537c471a2d51e46badc8abcaefc411603a3a6e"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.56.0/shape-0.56.0-linux-x86_64.tar.gz"
      sha256 "fd9f0a3c2f42ad85c8287a8a9f378ba46e31b9dc0c34faf4ccd8aff2b8b28575"
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

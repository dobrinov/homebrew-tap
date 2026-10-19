class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.60.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.60.3/shape-0.60.3-macos-arm64.tar.gz"
      sha256 "2c0d4cae88b6fce5db5b4107372641b4015ac1eb2b820611a802550dcff8a6f9"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.60.3/shape-0.60.3-macos-x86_64.tar.gz"
      sha256 "aea31a810013cc6634109d99a1c1383517854107886cd193b89e49a602429419"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.60.3/shape-0.60.3-linux-arm64.tar.gz"
      sha256 "f7086e147eaadbbc45845df9c491ec0f2852ad9c2ea7122b3e1bea62164eac2b"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.60.3/shape-0.60.3-linux-x86_64.tar.gz"
      sha256 "430499d7baff7b203c40bbc6e8a49319c5f89980c82b0ea084ecf58641439d6a"
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

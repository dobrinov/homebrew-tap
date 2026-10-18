class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.53.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.53.1/shape-0.53.1-macos-arm64.tar.gz"
      sha256 "7707f019a85d85182f6bce081f5e4e42751ea89db1a403987256901dd4d39f3a"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.53.1/shape-0.53.1-macos-x86_64.tar.gz"
      sha256 "9b14ddec89957b50ca92f3fa8c5a60a6291d6a2b1bb23e9d4570e8155db283c5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.53.1/shape-0.53.1-linux-arm64.tar.gz"
      sha256 "ec5f61661021fd1ba82b0f673e4249f1234a7f54e3448af6dc478a96bd464dc1"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.53.1/shape-0.53.1-linux-x86_64.tar.gz"
      sha256 "60958337dcdb8dba8e146f6eae81e9abdf13c7fda697bf3a8ae76be98ede63f2"
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

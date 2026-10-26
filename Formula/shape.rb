class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.83.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.83.0/shape-0.83.0-macos-arm64.tar.gz"
      sha256 "9ab7bf5a0a7581049e2e66054609c13a7c9f74ae828716e0e4419c565434510e"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.83.0/shape-0.83.0-macos-x86_64.tar.gz"
      sha256 "3aca3466d8008c65f6ba77db9b4ccaa5e19bfa277222341c67f13b4fb23b1999"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.83.0/shape-0.83.0-linux-arm64.tar.gz"
      sha256 "259ac96881a1f6499b8c8787d32492eb07b81964582f2c63733b9ea9ad5318f4"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.83.0/shape-0.83.0-linux-x86_64.tar.gz"
      sha256 "f1ea52798b68fcfe2d8fb72085f14e32f878edb1743872cc22af0ba7261b8ae3"
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

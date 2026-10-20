class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.69.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.69.1/shape-0.69.1-macos-arm64.tar.gz"
      sha256 "834669463ce8bfd1faa884612d7658d25dc0de84f2ebf9bcd85bf72d731ccaac"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.69.1/shape-0.69.1-macos-x86_64.tar.gz"
      sha256 "3e4e75b5ff48f399bac0c2bf5982ef93553fc4023ae9a58bf45f2e2472674643"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.69.1/shape-0.69.1-linux-arm64.tar.gz"
      sha256 "29f58761c9c980ebb992e0e5b51c43891c370c7c6ce433fd1c4d0414fb0171b7"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.69.1/shape-0.69.1-linux-x86_64.tar.gz"
      sha256 "fe435ec7bf4e5e58799e1d58652d7c86f4cb24f2243dd6c53a6ab84a6dc31ed9"
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

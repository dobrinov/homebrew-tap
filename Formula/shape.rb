class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.59.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.59.0/shape-0.59.0-macos-arm64.tar.gz"
      sha256 "d2a16cc81c74f3b5395ca697cd4b6e73e2b46cb4d471dbf55a1d45e0082af798"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.59.0/shape-0.59.0-macos-x86_64.tar.gz"
      sha256 "15383ec79a023086a9cc29d8ae290549164f3366db2a4027d01552a99e39d2ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.59.0/shape-0.59.0-linux-arm64.tar.gz"
      sha256 "dce80cd872b4abb302777bc10c02c4ce3bc10ed2487fc8bc330a37c4310a5f0a"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.59.0/shape-0.59.0-linux-x86_64.tar.gz"
      sha256 "d5ef57c52038df6295b2c41cc6b896883d20c26bc08783a2721fcd4d385b49c6"
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

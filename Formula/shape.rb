class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.61.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.61.0/shape-0.61.0-macos-arm64.tar.gz"
      sha256 "9709023bd54ce52b4df8912f098321f04aaa4c2248f6b1d024691b1b7daae179"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.61.0/shape-0.61.0-macos-x86_64.tar.gz"
      sha256 "ad045a9ac437d7176b5a69245cc5569e2a099f394026787916f494a48e87741f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.61.0/shape-0.61.0-linux-arm64.tar.gz"
      sha256 "057bc8d8b62d0962d36f1a1f808aa10f38c5d7a2c51cd32d110f029c1a518b16"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.61.0/shape-0.61.0-linux-x86_64.tar.gz"
      sha256 "a3125a2096a5e1cfb78417bab5a2e92e5d804c93df014f2b260b100261b97da0"
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

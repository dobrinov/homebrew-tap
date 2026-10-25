class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.80.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.80.1/shape-0.80.1-macos-arm64.tar.gz"
      sha256 "9524494142a47c47a411f11848f8f0515363f3207d22e341bf6bef7686861565"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.80.1/shape-0.80.1-macos-x86_64.tar.gz"
      sha256 "8b8275a91096ac8f4230c050918fc2e1caf5c542aec82b755d6646fce2f8129b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.80.1/shape-0.80.1-linux-arm64.tar.gz"
      sha256 "f8b1d2c3d9110b8801d8db3b3ca3ab98d61a0fcb942d43f591133fa1c96562df"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.80.1/shape-0.80.1-linux-x86_64.tar.gz"
      sha256 "82273b0b417a5ea88873208665bfdaf48d48e963d71f15f01e0b46542a7cb57f"
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

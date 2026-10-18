class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.53.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.53.0/shape-0.53.0-macos-arm64.tar.gz"
      sha256 "dae82e65c101da9dcdb85beb9947cc2287141153988d27e35b5b713b9b80356b"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.53.0/shape-0.53.0-macos-x86_64.tar.gz"
      sha256 "d3deab0489eb21b01e8ac47acfda8a778fc8d4c03f58c67900c5cf0b581cda41"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.53.0/shape-0.53.0-linux-arm64.tar.gz"
      sha256 "800927f2a64862ae111f09060dcdab03d3189a7c0f4e8051af15429715fcb0cf"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.53.0/shape-0.53.0-linux-x86_64.tar.gz"
      sha256 "1c6f28acfe694d1a553fe7f6c6ef0a177d144d705c037aa05cb6b0e68f708ab7"
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

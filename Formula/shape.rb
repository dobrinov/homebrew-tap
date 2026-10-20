class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.67.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.67.0/shape-0.67.0-macos-arm64.tar.gz"
      sha256 "d0da8aff72a99a98e7c3ba3c090811649ebedac2740e2ac09b03849f233fd4f0"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.67.0/shape-0.67.0-macos-x86_64.tar.gz"
      sha256 "3ccf7f0e7738f8db5bd9a133f8122364dd468afd9a88349973f4fa0ccae4908c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.67.0/shape-0.67.0-linux-arm64.tar.gz"
      sha256 "52477b72079112b3d498bed171310b8081469a0e95576fcf1cffb88e8d3b8907"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.67.0/shape-0.67.0-linux-x86_64.tar.gz"
      sha256 "93db0e4f512ed476d49b736983735d97cf5434ebaf7ed961fa1062f91a25fc9a"
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

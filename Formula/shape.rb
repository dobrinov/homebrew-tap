class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.72.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.72.0/shape-0.72.0-macos-arm64.tar.gz"
      sha256 "2eee0cd6e3e0f2be1f139390a40a87e767f5959dc5312daf7aace58913023e45"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.72.0/shape-0.72.0-macos-x86_64.tar.gz"
      sha256 "d2387d192e88b143cb5bc15560763a607750293cd156156db587bd738f6f3f84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.72.0/shape-0.72.0-linux-arm64.tar.gz"
      sha256 "ce9b9af1e9377d78a10583a4448396c1d9eee668665576239ea9fb42283fc524"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.72.0/shape-0.72.0-linux-x86_64.tar.gz"
      sha256 "35c9a878d55024d0a0acbac31ccde8b14cc75d6027e67b46eb25b51c22f243a1"
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

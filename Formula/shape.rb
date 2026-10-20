class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.69.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.69.0/shape-0.69.0-macos-arm64.tar.gz"
      sha256 "aa8e5a4d5caeae072f484621b76aea3c2bc6b80689c33692f13a4d154f125aac"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.69.0/shape-0.69.0-macos-x86_64.tar.gz"
      sha256 "b56ea431a57c4a762ccffc3d76459a6e195b7d02b0e33af2c362d55ed5b427ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.69.0/shape-0.69.0-linux-arm64.tar.gz"
      sha256 "01f549918fd128400e47abfdea9bc22439f92261d537032440c44144eec60ad1"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.69.0/shape-0.69.0-linux-x86_64.tar.gz"
      sha256 "4c92ae63e224cf0d4dc8bca24fbd2169bbf2a4eb49e34afa7a177be17763414e"
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

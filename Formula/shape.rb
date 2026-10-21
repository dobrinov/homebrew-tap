class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.71.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.71.0/shape-0.71.0-macos-arm64.tar.gz"
      sha256 "1db62f317ce7448dd859b659baa1484fd19d4431e5b6939bd2c3bca35fd77212"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.71.0/shape-0.71.0-macos-x86_64.tar.gz"
      sha256 "dd93fe553d5b2a6f9cac9cf2ecf8f584cc945520e79ae26135b4f8e7d10dc8ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.71.0/shape-0.71.0-linux-arm64.tar.gz"
      sha256 "633ff711204b04a8a751f27c1b39b9bbd35e215a760bc191b6c1a4c81a57c437"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.71.0/shape-0.71.0-linux-x86_64.tar.gz"
      sha256 "8e811eca1d527f33be62d5655abf3e25b898be65c214c5048493cc6b2a257a98"
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

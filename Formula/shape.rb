class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.82.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.82.1/shape-0.82.1-macos-arm64.tar.gz"
      sha256 "2d58d940c3a68a57be31d1a8e748be2fd860bb06c852cc1fb547b3b28980d9df"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.82.1/shape-0.82.1-macos-x86_64.tar.gz"
      sha256 "9a583d98ebb089a4de330894dcc7211a96688956b336579ae805591fdddd66f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.82.1/shape-0.82.1-linux-arm64.tar.gz"
      sha256 "69e1521664b26c02a441b05526ae5c0504ba342ae7833d6c5fb7207cba96995d"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.82.1/shape-0.82.1-linux-x86_64.tar.gz"
      sha256 "1da7d1ccc2e1ccac8f941863729343cbab44cd7d82432d53312c99190305b2f3"
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

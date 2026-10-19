class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.63.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.63.0/shape-0.63.0-macos-arm64.tar.gz"
      sha256 "d0fec23526e325b0995bca5ddb6a7667dd4d495b7144c84ebe9fe699b8af19ef"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.63.0/shape-0.63.0-macos-x86_64.tar.gz"
      sha256 "8def5a81cb2236b897fb980777222e0033d2bbb16ff5a97e82450ebeb17c13d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.63.0/shape-0.63.0-linux-arm64.tar.gz"
      sha256 "6444fd2385f20c6c396ca2fceb3e8c762545e3e6b38d30922aadda9b166970f1"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.63.0/shape-0.63.0-linux-x86_64.tar.gz"
      sha256 "a2babb4387527ad65c641e5dc80a7e89660164d7fe73ddc9559563258b657d3a"
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

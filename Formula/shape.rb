class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.80.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.80.0/shape-0.80.0-macos-arm64.tar.gz"
      sha256 "80d402061a4ae2fb7715d7afaf8fb44a24fb275b1768f13ef2385680e97ee0bf"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.80.0/shape-0.80.0-macos-x86_64.tar.gz"
      sha256 "938a181144d5097e34888648b03581a87c38c9081519a893de0c6d544e83aa4d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.80.0/shape-0.80.0-linux-arm64.tar.gz"
      sha256 "7f48baaf186f43362f36fa78059c4a165fa1972855fe10519d10c282de4d0cb2"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.80.0/shape-0.80.0-linux-x86_64.tar.gz"
      sha256 "2be8b91962c33454f6ce710ce54aa8f3ef55e2ee390ae9dce8401252190b3878"
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

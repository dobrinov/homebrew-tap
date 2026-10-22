class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.73.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.73.0/shape-0.73.0-macos-arm64.tar.gz"
      sha256 "c2fe1cf8a0753c920a4a6dad21bf535e40680d87d69510c5ab13eb55afaf4b03"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.73.0/shape-0.73.0-macos-x86_64.tar.gz"
      sha256 "befeac163f1b553880df456ac33cc58eb8affdb6e259432a67c1333cb9f738cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.73.0/shape-0.73.0-linux-arm64.tar.gz"
      sha256 "bcc5cd053e12726f4ca69ed3a5ad824cce437115217e32530dcef60693b8e760"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.73.0/shape-0.73.0-linux-x86_64.tar.gz"
      sha256 "a35d101a57cf42178c4581c6474e93a53f6890007efa9cbc01fefd2430f387f0"
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

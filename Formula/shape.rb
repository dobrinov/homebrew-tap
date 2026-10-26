class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.82.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.82.2/shape-0.82.2-macos-arm64.tar.gz"
      sha256 "ca3a3e17a481c95489d229d41b443ae9fc01b2469edb9fe9b6a56a2f3d510e1a"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.82.2/shape-0.82.2-macos-x86_64.tar.gz"
      sha256 "74000584222b793d8e0f6b278198f982ddb3a0dd690418ccbc6b2d585db3e777"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.82.2/shape-0.82.2-linux-arm64.tar.gz"
      sha256 "b1fe41c9f59fb518909cb292732748171bfd2ed6a663cc91c2d1aa8e7046d047"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.82.2/shape-0.82.2-linux-x86_64.tar.gz"
      sha256 "ba5bd67a94de9a80ac4b41a385e497667c659509d479e6cff69f1f21f9d8547c"
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

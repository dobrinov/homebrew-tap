class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.79.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.79.0/shape-0.79.0-macos-arm64.tar.gz"
      sha256 "dd42d080f932b9c91f5cf37e8e6318e10f7ba9dc43fb55e61273c85704e08507"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.79.0/shape-0.79.0-macos-x86_64.tar.gz"
      sha256 "e13793a805d1e37fa097ae0bd703ebee0ba0e3e629e778fb9b766ebd6f630e60"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.79.0/shape-0.79.0-linux-arm64.tar.gz"
      sha256 "87ddb35ecb7ad95edb3d598a748071192c4dadb8f3ae33258eae8edf764668b8"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.79.0/shape-0.79.0-linux-x86_64.tar.gz"
      sha256 "48c184079a3fb1f2833371df4913cb30de6a8be41403d223de9c8ed8bc65eaa6"
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

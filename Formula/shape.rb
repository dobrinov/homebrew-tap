class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.78.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.78.0/shape-0.78.0-macos-arm64.tar.gz"
      sha256 "ef1e4a428775b29a4a9b74a5d9fb4d1a485fc514138c34eb8d807b657ca3c438"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.78.0/shape-0.78.0-macos-x86_64.tar.gz"
      sha256 "58e0efa89a4d99f59a07b673e5c52e4eb3dff6d385cdcb1406fcb4050ce0d98f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.78.0/shape-0.78.0-linux-arm64.tar.gz"
      sha256 "8f3c79dddfd813e2abb924ac81292ead2184b40c33d6b7731811a0733c2c1e3d"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.78.0/shape-0.78.0-linux-x86_64.tar.gz"
      sha256 "9fc74491c36c209a33435aa649e52320f44943f42efc6ac1d581d7068eff1675"
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

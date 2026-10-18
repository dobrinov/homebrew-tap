class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.57.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.57.0/shape-0.57.0-macos-arm64.tar.gz"
      sha256 "36745b8fee4fcf7e542118a74e361986189e2f48faa8fa699d32e81dcf7e6ccf"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.57.0/shape-0.57.0-macos-x86_64.tar.gz"
      sha256 "2b9dbc7179997c290a2c043ef929b8a118a39c762a394a86003d79222cb3454f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.57.0/shape-0.57.0-linux-arm64.tar.gz"
      sha256 "1c5a736902549b66141d410a5e477466debd36d5a4c91a01ae8e1b5ffa27c0ff"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.57.0/shape-0.57.0-linux-x86_64.tar.gz"
      sha256 "d7c8dcf3650f8151f92456b65d3822687dfe09c0d4acd38106b5335496c96255"
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

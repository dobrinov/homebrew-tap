class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.55.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.55.0/shape-0.55.0-macos-arm64.tar.gz"
      sha256 "e9b79119b469880a5a0462023fb35a00b1fe82c3abd4023f2d14603c6247127c"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.55.0/shape-0.55.0-macos-x86_64.tar.gz"
      sha256 "95c71b55a0be291b2b3e1740e117c7c5a6ea489880daf71f1ff7dd605f33b8dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.55.0/shape-0.55.0-linux-arm64.tar.gz"
      sha256 "246dd0c916a0316ce8805994939b488efc02d01ec6431ebc34a991513b0f2686"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.55.0/shape-0.55.0-linux-x86_64.tar.gz"
      sha256 "d782020b0820f6415cadf5b80aabac71ea5be62ab4dd27f3dc399681a8a5c6cd"
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

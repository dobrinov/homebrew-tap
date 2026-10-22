class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.75.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.75.0/shape-0.75.0-macos-arm64.tar.gz"
      sha256 "80e379335af3ebd01f6caae70b1fae9edcfc0ca683e5fc8c360a4d2ef76e8cd5"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.75.0/shape-0.75.0-macos-x86_64.tar.gz"
      sha256 "f29a4ec3ddf61dfaa7a7374fc46bdff011e93e13bd3340b89411011bc18684c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.75.0/shape-0.75.0-linux-arm64.tar.gz"
      sha256 "2e0784f1d8dc7b3fd99a1c1e9fe48e2f1f2a773c534b14126b3da3288c486421"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.75.0/shape-0.75.0-linux-x86_64.tar.gz"
      sha256 "4abbf546c2b02e2cebcc52687ce3c5469edabad703c02e013cd82986a89d3ecd"
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

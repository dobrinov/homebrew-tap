class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.55.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.55.1/shape-0.55.1-macos-arm64.tar.gz"
      sha256 "f187604be64a0f17d044bac26b6f2f91137d48cca872dbc373058c98f377652b"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.55.1/shape-0.55.1-macos-x86_64.tar.gz"
      sha256 "37768d8a890d3b26575be2625d399611dac3d1f69de60e722175c00692424722"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.55.1/shape-0.55.1-linux-arm64.tar.gz"
      sha256 "bd3bd87f1b250d27f2734d45c4c21e60376e3d12c806ceac17f5c7faf89ae690"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.55.1/shape-0.55.1-linux-x86_64.tar.gz"
      sha256 "ba8c10f4759355cf873136b33fcbba53ea3184d533b37840f91abeff41a3a7b0"
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

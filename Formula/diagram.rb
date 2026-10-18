class Diagram < Formula
  desc "FigJam-style boards as plain text: mindmaps, kanban, gantt, sequence and ER diagrams"
  homepage "https://github.com/dobrinov/diagram"
  version "0.40.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.40.1/diagram-0.40.1-macos-arm64.tar.gz"
      sha256 "9831909ff77c3e59ee72676b53e9121cadcb5191b49167471f31420bb7f0acc5"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.40.1/diagram-0.40.1-macos-x86_64.tar.gz"
      sha256 "8f32d605d2054a1a27a5f3a728d015ade2ea072154b3745bad4a48dc845c2c05"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.40.1/diagram-0.40.1-linux-arm64.tar.gz"
      sha256 "3eb11b50297ee68ede7e13d9e00dd43890e06cdc9f1b4a89bafda25f7333258f"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.40.1/diagram-0.40.1-linux-x86_64.tar.gz"
      sha256 "322978a163ec4c1eba90e251e4a730631f203377322b482347eb6d5e09e7d7bd"
    end
  end

  def install
    bin.install "diagram"
  end

  def caveats
    <<~TXT
      Own file icons, and open boards from Finder: diagram install-app
      Agent skills for Claude Code: diagram skills install
      Merge boards element by element in a repository: diagram merge --install
    TXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diagram --version")
  end
end

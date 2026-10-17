class Diagram < Formula
  desc "FigJam-style boards as plain text: mindmaps, kanban, gantt, sequence and ER diagrams"
  homepage "https://github.com/dobrinov/diagram"
  version "0.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.31.0/diagram-0.31.0-macos-arm64.tar.gz"
      sha256 "288e8bed21774f370e3db3d2b3d2284e15d3fbed73c5ae9b45ac411fce302179"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.31.0/diagram-0.31.0-macos-x86_64.tar.gz"
      sha256 "bb71a6285b9e0b701d1b3169a08da5034db87a06fbd5cd11b0463c8598c559c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.31.0/diagram-0.31.0-linux-arm64.tar.gz"
      sha256 "568137bdb364fd270a7cdb425d3e0d89e0d6bf7df98b62c3a18f944a629ec02d"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.31.0/diagram-0.31.0-linux-x86_64.tar.gz"
      sha256 "eb4c37313ae99f83af21724b97149136e462936c2f3db99fca5f5368d5909727"
    end
  end

  def install
    bin.install "diagram"
  end

  def caveats
    <<~TXT
      Agent skills for Claude Code: diagram skills install
      Merge boards element by element in a repository: diagram merge --install
    TXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/diagram --version")
  end
end

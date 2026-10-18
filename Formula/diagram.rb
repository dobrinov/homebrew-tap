class Diagram < Formula
  desc "FigJam-style boards as plain text: mindmaps, kanban, gantt, sequence and ER diagrams"
  homepage "https://github.com/dobrinov/diagram"
  version "0.52.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.52.0/diagram-0.52.0-macos-arm64.tar.gz"
      sha256 "579c98f281576cbb4f07b4915b6271ec294ef388941533527638f5908296d34c"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.52.0/diagram-0.52.0-macos-x86_64.tar.gz"
      sha256 "b634249126433d3e2822c433aa970b2f784c13dff1946329042e644e79744a36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.52.0/diagram-0.52.0-linux-arm64.tar.gz"
      sha256 "db4f015f7172f7a0b7aab416d513b3dfe9d1e527a3d3f4ae5b7311f2388e586a"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.52.0/diagram-0.52.0-linux-x86_64.tar.gz"
      sha256 "07f78dfb87ec998fe710eb69b63f835b9f968991deb3a7ba38e61fe7a12097c7"
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

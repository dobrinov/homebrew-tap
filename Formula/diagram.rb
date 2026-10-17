class Diagram < Formula
  desc "FigJam-style boards as plain text: mindmaps, kanban, gantt, sequence and ER diagrams"
  homepage "https://github.com/dobrinov/diagram"
  version "0.36.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.36.0/diagram-0.36.0-macos-arm64.tar.gz"
      sha256 "11f7a80eab8f95da682a8bec1d5db43f74dae3e2e3446e605e858b3e2da8c176"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.36.0/diagram-0.36.0-macos-x86_64.tar.gz"
      sha256 "eb3e22a9631108f6e43f4573ae3739e936ff535de45e9202dc19e7dd05937257"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.36.0/diagram-0.36.0-linux-arm64.tar.gz"
      sha256 "decb53771bcea1b7aa3dc2d6744ed9004cc7ff5e0605b04f467a29126d4d5f57"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.36.0/diagram-0.36.0-linux-x86_64.tar.gz"
      sha256 "a722f4e1dba95457474ddfb4637174c244ad0507725cdd7c011e062521f350e6"
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

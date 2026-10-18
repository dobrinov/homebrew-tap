class Diagram < Formula
  desc "FigJam-style boards as plain text: mindmaps, kanban, gantt, sequence and ER diagrams"
  homepage "https://github.com/dobrinov/diagram"
  version "0.45.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.45.0/diagram-0.45.0-macos-arm64.tar.gz"
      sha256 "5d1c4fee2e3242e7b2a1358f3ec4c85857dc8cc7a7ef086c8d807111992fef47"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.45.0/diagram-0.45.0-macos-x86_64.tar.gz"
      sha256 "874aaf9326d8eefed688b2cc9d767e0028ad3107405a411b7b119aaf88dfba50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.45.0/diagram-0.45.0-linux-arm64.tar.gz"
      sha256 "a2976cddee4d43c687e8bd71f372741a105bb7fb5c7bf6081aebd43371be89b8"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.45.0/diagram-0.45.0-linux-x86_64.tar.gz"
      sha256 "7a372753340293544bb6820662b62b9e9e27fa69da8ed38eab4fd29fb127e9e1"
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

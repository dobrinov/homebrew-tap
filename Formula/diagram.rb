class Diagram < Formula
  desc "FigJam-style boards as plain text: mindmaps, kanban, gantt, sequence and ER diagrams"
  homepage "https://github.com/dobrinov/diagram"
  version "0.38.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.38.0/diagram-0.38.0-macos-arm64.tar.gz"
      sha256 "8064676b2fb5e34b042ee25ee9d36ee26dfa41fffdd7dbf622e0e63435130060"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.38.0/diagram-0.38.0-macos-x86_64.tar.gz"
      sha256 "9915c5e1392201d429105a4ea1ba9d2ca7e4afe9049ea21ffabb23facd26cd79"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.38.0/diagram-0.38.0-linux-arm64.tar.gz"
      sha256 "542b190d31a467eeeee3a47f4eda2ff7988b60678c66c205fc2677a20b63e2c2"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.38.0/diagram-0.38.0-linux-x86_64.tar.gz"
      sha256 "562248a6e1cd8ac531e9d0521b8eb6db156b180cd874f5d5bb0bf850d643ef04"
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

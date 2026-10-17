class Diagram < Formula
  desc "FigJam-style boards as plain text: mindmaps, kanban, gantt, sequence and ER diagrams"
  homepage "https://github.com/dobrinov/diagram"
  version "0.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.34.0/diagram-0.34.0-macos-arm64.tar.gz"
      sha256 "711be5b6609fbec8042a8e8941783f44a2d66e9e4e8d63c01cc42152d045ff5c"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.34.0/diagram-0.34.0-macos-x86_64.tar.gz"
      sha256 "f7ddcd9eabf40f334e312baabcfef07d935666fbd3ac8b1871f79fdab24561ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.34.0/diagram-0.34.0-linux-arm64.tar.gz"
      sha256 "fb264e78ef5f14700b12a56be3e5ff4d200975717264ddbebfcd6f515717d99d"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.34.0/diagram-0.34.0-linux-x86_64.tar.gz"
      sha256 "7e65ef4bb42175ba9aad02845ecfb57c061bdb184e000d0d917341d480a66c23"
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

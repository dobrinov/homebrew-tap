class Diagram < Formula
  desc "FigJam-style boards as plain text: mindmaps, kanban, gantt, sequence and ER diagrams"
  homepage "https://github.com/dobrinov/diagram"
  version "0.35.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.35.0/diagram-0.35.0-macos-arm64.tar.gz"
      sha256 "cd6ad9fc37a2c30fe79edc41c4a2c47a9a56a6970612a52538db3a75d2d98530"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.35.0/diagram-0.35.0-macos-x86_64.tar.gz"
      sha256 "e31db4be9849e22e5b21139d2ab7a5518d6ac87ab7deeddc2f602832a74a6c01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.35.0/diagram-0.35.0-linux-arm64.tar.gz"
      sha256 "05f5ce13d826209c14304d354221971d4b314235a824042afb2b321c995efee0"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.35.0/diagram-0.35.0-linux-x86_64.tar.gz"
      sha256 "8f43745571ff47aef266b433ddf6a35976eaff1f10ec35b77a78ebcd37685c1c"
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

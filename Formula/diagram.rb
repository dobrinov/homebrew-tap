class Diagram < Formula
  desc "FigJam-style boards as plain text: mindmaps, kanban, gantt, sequence and ER diagrams"
  homepage "https://github.com/dobrinov/diagram"
  version "0.40.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.40.0/diagram-0.40.0-macos-arm64.tar.gz"
      sha256 "0a198205f9889ff9bbe6a2ad0648b8ab47f05794ffae7ce8df29f81fd98af059"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.40.0/diagram-0.40.0-macos-x86_64.tar.gz"
      sha256 "209fbbac7d29097c028f1cbeac9854a7d97920b86a4a8e8a46db21449e1d2dbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.40.0/diagram-0.40.0-linux-arm64.tar.gz"
      sha256 "75292e0ef8bb63e2bdda7fa4ff832a265baba45551cb7454a9ffa864eed5200d"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.40.0/diagram-0.40.0-linux-x86_64.tar.gz"
      sha256 "9cc1d2fd36cb6761ec77b0423ae5a60c4f3db5a9496049a575d28cc09136e7e3"
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

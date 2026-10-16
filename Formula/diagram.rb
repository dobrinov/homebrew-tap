class Diagram < Formula
  desc "FigJam-style boards as plain text: mindmaps, kanban, gantt, sequence and ER diagrams"
  homepage "https://github.com/dobrinov/diagram"
  version "0.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.30.0/diagram-0.30.0-macos-arm64.tar.gz"
      sha256 "dc8219306ba4927b0f91b20c91df4c1774659bca31a55d032a621f0364a0cf2c"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.30.0/diagram-0.30.0-macos-x86_64.tar.gz"
      sha256 "eff9b929e4abaf7b7b6774a9a678e9abb0f940646a66e8181d786b07682ac70c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/diagram/releases/download/v0.30.0/diagram-0.30.0-linux-arm64.tar.gz"
      sha256 "47f3b32a40c358ad145c446aa0b08d8bbbe734b8dab092f6319c2dbb5f584b7e"
    end
    on_intel do
      url "https://github.com/dobrinov/diagram/releases/download/v0.30.0/diagram-0.30.0-linux-x86_64.tar.gz"
      sha256 "b6ef0f777e96c25eef9b838f09bc6830fb2453d19bb6ade52e1b50465259caf0"
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

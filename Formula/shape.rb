class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.70.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.70.0/shape-0.70.0-macos-arm64.tar.gz"
      sha256 "8219beb066666b7d3b7a31dba742769657b76336da91584a0c78205cd50bedce"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.70.0/shape-0.70.0-macos-x86_64.tar.gz"
      sha256 "f142f1d854cc5ce27b95382abacaf3759b338f71ca11784b02ddb7e2f027c18d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.70.0/shape-0.70.0-linux-arm64.tar.gz"
      sha256 "57b7ccd9529d425bff5c699be7835d275bf9b0bb6859cca34d43588324a33a2a"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.70.0/shape-0.70.0-linux-x86_64.tar.gz"
      sha256 "a6cc13260e64a7f783e92ae04096f27f264d8d6df1da30ca422f1110a57fbab6"
    end
  end

  def install
    bin.install "shape"
    # the command's name before the rename to Shape
    bin.install_symlink "shape" => "diagram"
  end

  def caveats
    <<~TXT
      Own file icons, and open boards from Finder: shape install-app
      Agent skills for Claude Code: shape skills install
      Merge boards element by element in a repository: shape merge --install
      `diagram` still works: it is the same command.
    TXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shape --version")
    assert_match version.to_s, shell_output("#{bin}/diagram --version")
  end
end

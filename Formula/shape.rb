class Shape < Formula
  desc "One board for the whole project, as text, with your AI: plans, wireframes, slides"
  homepage "https://github.com/dobrinov/shape"
  version "0.82.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.82.0/shape-0.82.0-macos-arm64.tar.gz"
      sha256 "e13c2ea1c6336b8338e6b4852b4a256044a57df1e36b24fe34dbb748ca75c27c"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.82.0/shape-0.82.0-macos-x86_64.tar.gz"
      sha256 "8193b6aa985add6fc6ef9b654e30450ddd052bcdb6b0a285f95150abcd422087"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/shape/releases/download/v0.82.0/shape-0.82.0-linux-arm64.tar.gz"
      sha256 "db62357ea505655f2f68c84e9aac2c4bad60efa425ca2ec93861df9f6b3a7f81"
    end
    on_intel do
      url "https://github.com/dobrinov/shape/releases/download/v0.82.0/shape-0.82.0-linux-x86_64.tar.gz"
      sha256 "9862c47bf339d930b103bbf024e29ad7e2ad12e7d15be5975ad7e7934bde3f0a"
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

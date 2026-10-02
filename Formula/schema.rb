class Schema < Formula
  desc "Interactive ER diagrams and visual git diffs for Postgres structure.sql files"
  homepage "https://github.com/dobrinov/schema"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.5.0/schema-0.5.0-macos-arm64.tar.gz"
      sha256 "5f428ba3e31a39f9e5e235b440afbb4a4d2685be409e67dda853a8099f52a7b9"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.5.0/schema-0.5.0-macos-x86_64.tar.gz"
      sha256 "2884a5420c8fab2f62d16a71f1d7a1bb3bdb7b36c9b354fa52ce9e46f1ff0d97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.5.0/schema-0.5.0-linux-arm64.tar.gz"
      sha256 "86c6050cefb792d85f3d7e8f129b6818cbcfe626aee5564d937e4b4a01bbbaa4"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.5.0/schema-0.5.0-linux-x86_64.tar.gz"
      sha256 "44adafed2d30d58a178d133ce7a123a85104136abc1f64e034acdb910378df27"
    end
  end

  def install
    bin.install "schema"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/schema --version")
  end
end
